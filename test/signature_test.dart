import 'dart:io';

import 'package:librsync/patch.dart';
import 'package:librsync/signature.dart';
import 'package:test/test.dart';

import 'bytes_stream_consumer.dart';
import 'helpers.dart';

Future<SignatureType> testCreateSignature(Stream<List<int>> src) async {
  final magic = blake2SigMagic;
  final blockLen = 512;
  final strongLen = 32;

  final s = createSignature(src, null, blockLen, strongLen, magic);
  return s;
}

void main() {
  group('signature', () {
    test('Basic', () async {
      for (var tt in allTestCases) {
        final tuple = argsFromTestName(tt);
        final file = tuple.item1;
        final magic = tuple.item2;
        final blockLen = tuple.item3;
        final strongLen = tuple.item4;
        final error = tuple.item5;
        expect(error, null);

        final inputData = await File('./test/testdata/$file.old').readAsBytes();
        final input = Stream<List<int>>.fromIterable([inputData]);

        final bytesStreamConsumer = BytesStreamConsumer();
        final sink = IOSink(bytesStreamConsumer);
        final got =
            await createSignature(input, sink, blockLen, strongLen, magic);

        final expected =
            await readSignatureFile('./test/testdata/$tt.signature');
        expect(got.blockLen, expected.blockLen);
        expect(got.sigType, expected.sigType);
        expect(got.strongLen, expected.strongLen);

        final expectedSigBytes =
            File('./test/testdata/$tt.signature').readAsBytesSync();
        final gotSigBytes = bytesStreamConsumer.toUint8List();
        expect(gotSigBytes, expectedSigBytes);
      }
    });
  });
}
