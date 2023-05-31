import 'dart:io';

import 'package:librsync/patch.dart';
import 'package:test/test.dart';

import 'bytes_stream_consumer.dart';
import 'helpers.dart';

void main() {
  group('Patch', () {
    test('Basic', () async {
      for (var tt in allTestCases) {
        final tuple = argsFromTestName(tt);
        final file = tuple.item1;
        final err = tuple.item5;
        expect(err, null);

        final baseFile = await File('./test/testdata/$file.old').open();
        final deltaFile = File('./test/testdata/$tt.delta').openRead();

        final output = BytesStreamConsumer();
        final sink = IOSink(output);

        await patchWithBaseFile(baseFile, deltaFile, sink);

        final expected = File('./test/testdata/$file.new').readAsBytesSync();
        final got = output.toUint8List();

        expect(got, expected);
      }
    });
  });
}
