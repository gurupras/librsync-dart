import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:librsync/delta.dart';
import 'package:librsync/signature.dart';
import 'package:librsync/src/op.dart';

typedef MagicNumber = int;

const MagicNumber deltaMagic = 0x72730236;
const MagicNumber md4SigMagic = 0x72730136;
const MagicNumber blake2SigMagic = 0x72730137;

abstract interface class ReadSeeker {
  Future<void> seek(int pos);
  Future<Uint8List> read(int count);
}

Future<int> readParam(ChunkedStreamReader<int> src, int size) async {
  switch (size) {
    case 1:
    case 2:
    case 4:
    case 8:
      return readFixedInt(src, size);
  }
  return 0;
}

class FileReadSeeker implements ReadSeeker {
  final RandomAccessFile f;

  FileReadSeeker({required this.f});

  @override
  Future<void> seek(int pos) {
    return f.setPosition(pos);
  }

  @override
  Future<Uint8List> read(int count) {
    return f.read(count);
  }
}

Future<void> patchWithBaseFile(
    RandomAccessFile base, Stream<List<int>> delta, IOSink out) async {
  return patch(FileReadSeeker(f: base), delta, FileWriter(out));
}

Future<void> patch(ReadSeeker base, Stream<List<int>> delta, Writer out) async {
  final chunkedDeltaReader = ChunkedStreamReader<int>(delta);
  final magic = await readInt(chunkedDeltaReader);

  if (magic != deltaMagic) {
    throw FormatException(
        'Got magic number ${magic.toRadixString(16)} rather than expected value ${deltaMagic.toRadixString(16)}');
  }

  Op op = await readFixedInt(chunkedDeltaReader, 1);

  while (op != 0) {
    final cmd = op2cmd[op];

    int param1, param2 = 0;

    if (cmd.len1 == 0) {
      param1 = cmd.immediate;
    } else {
      param1 = await readParam(chunkedDeltaReader, cmd.len1);
      param2 = await readParam(chunkedDeltaReader, cmd.len2);
    }

    switch (cmd.kind) {
      case KIND_LITERAL:
        {
          final bytes = await chunkedDeltaReader.readBytes(param1);
          await out.write(bytes);
          break;
        }
      case KIND_COPY:
        {
          await base.seek(param1);
          final bytes = await base.read(param2);
          await out.write(bytes);
          break;
        }
      case KIND_END:
        return;
      default:
        throw Exception('Bogus command ${cmd.kind.toRadixString(16)}');
    }
    op = await readFixedInt(chunkedDeltaReader, 1);
  }
}
