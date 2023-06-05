import 'dart:io';
import 'package:async/async.dart';
import 'package:librsync/patch.dart';
import 'dart:typed_data';

import 'package:librsync/src/rollsum.dart';
import 'package:pointycastle/export.dart';

const blake2SumLength = 32;
const md4SumLength = 16;

class SignatureType {
  MagicNumber sigType;
  int blockLen;
  int strongLen;
  List<Uint8List> strongSigs;
  Map<int, int> weak2block;

  SignatureType({
    required this.sigType,
    required this.blockLen,
    required this.strongLen,
    required this.strongSigs,
    required this.weak2block,
  });
}

Future<Uint8List> calcStrongSum(
    Uint8List data, MagicNumber sigType, int strongLen) async {
  switch (sigType) {
    case blake2SigMagic:
      final digest = Blake2bDigest(digestSize: 32);
      final hash = digest.process(data);
      return Uint8List.fromList(hash.sublist(0, strongLen));
    case md4SigMagic:
      final alg = Digest("MD4");
      final hash = alg.process(data);
      return Uint8List.fromList(hash.sublist(0, strongLen));
    default:
      throw Exception('Invalid sigType ${sigType.toString()}');
  }
}

Future<SignatureType> createSignature(Stream<List<int>> input, IOSink? output,
    int blockLen, int strongLen, MagicNumber sigType) async {
  int maxStrongLen;

  switch (sigType) {
    case blake2SigMagic:
      maxStrongLen = blake2SumLength;
      break;
    case md4SigMagic:
      maxStrongLen = md4SumLength;
      break;
    default:
      throw "Invalid sigType $sigType";
  }

  if (strongLen > maxStrongLen) {
    throw "Invalid strongLen $strongLen for sigType $sigType";
  }

  ByteData byteData = ByteData(4);
  byteData.setUint32(0, sigType, Endian.big);
  output?.add(byteData.buffer.asUint8List());

  byteData.setUint32(0, blockLen, Endian.big);
  output?.add(byteData.buffer.asUint8List());

  byteData.setUint32(0, strongLen, Endian.big);
  output?.add(byteData.buffer.asUint8List());

  SignatureType signature = SignatureType(
      blockLen: blockLen,
      sigType: sigType,
      strongLen: strongLen,
      strongSigs: [],
      weak2block: {});

  final chunkedReader = ChunkedStreamReader(input);
  while (true) {
    final bytes = await chunkedReader.readChunk(blockLen);
    final block = Uint8List.fromList(bytes);
    final bytesRead = bytes.length;
    if (bytesRead == 0) {
      break;
    }

    Uint8List data = Uint8List.view(block.buffer, 0, bytesRead);

    int weak = weakChecksum(data);
    byteData.setUint32(0, weak, Endian.big);
    output?.add(byteData.buffer.asUint8List());

    Uint8List strong = await calcStrongSum(data, sigType, strongLen);
    output?.add(strong);

    signature.weak2block[weak] = signature.strongSigs.length;
    signature.strongSigs.add(strong);
  }

  return signature;
}

Future<SignatureType> readSignature(Stream<List<int>> input) async {
  final chunkedReader = ChunkedStreamReader<int>(input);
  final magic = await readInt(chunkedReader);
  final blockLen = await readInt(chunkedReader);
  final strongLen = await readInt(chunkedReader);

  final strongSigs = <Uint8List>[];
  final weak2block = <int, int>{};

  for (;;) {
    int weakSum = 0;
    try {
      weakSum = await readInt(chunkedReader);
    } catch (e) {
      if (e == 'EOF') {
        break;
      } else {
        rethrow;
      }
    }
    final strongSum = await chunkedReader.readBytes(strongLen);
    weak2block[weakSum] = strongSigs.length;
    strongSigs.add(strongSum);
  }

  return SignatureType(
      sigType: magic,
      blockLen: blockLen,
      strongLen: strongLen,
      strongSigs: strongSigs,
      weak2block: weak2block);
}

Future<int> readInt(ChunkedStreamReader<int> input) async {
  return readFixedInt(input, 4);
}

Future<int> readFixedInt(ChunkedStreamReader<int> input, int size) async {
  final list = await input.readChunk(size);
  if (list.length < size) {
    throw 'EOF';
  }
  int value = 0;
  for (int i = 0; i < size; i++) {
    value = (value << 8) | list[i];
  }
  return value;
}

int parseIntUsingByteData(List<int> list) {
  Uint8List bytes = Uint8List.fromList(list);
  ByteData byteData = ByteData.view(bytes.buffer);
  switch (list.length) {
    case 1:
      return byteData.getUint8(0);
    case 2:
      return byteData.getUint16(0, Endian.big);
    case 4:
      return byteData.getUint32(0, Endian.big);
    case 8:
      return byteData.getUint64(0, Endian.big);
    default:
      throw 'Unexpected size ${list.length}';
  }
}

int parseIntBitWise(List<int> bytes) {
  int value = 0;
  for (int i = 0; i < bytes.length; i++) {
    value = (value << 8) | bytes[i];
  }
  return value;
}

Future<SignatureType> readSignatureFile(String path) async {
  final file = File(path).openRead();
  return readSignature(file);
}
