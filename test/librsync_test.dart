import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:librsync/delta.dart';
import 'package:librsync/patch.dart';
import 'package:librsync/src/delta_stream.dart';
import 'package:librsync/src/reader_writer.dart';
import 'package:test/test.dart';

import 'bytes_stream_consumer.dart';
import 'circbuf/circbuf_test.dart';
import 'delta_test.dart';
import 'signature_test.dart';

class SeekableList implements ReadSeeker {
  final List<int> buf;
  int pos;
  SeekableList(this.buf) : pos = 0;

  @override
  Future<void> seek(int pos) async {
    this.pos = pos;
  }

  @override
  Future<Uint8List> read(int count) async {
    return readSync(count);
  }

  @override
  Uint8List readSync(int count) {
    return Uint8List.fromList(buf.sublist(pos, pos + count));
  }
}

void main() {
  group('librsync', () {
    test('end-to-end', () async {
      final base = toBytes("Hello World");
      final target = toBytes("Hollywood");

      final sig = await testCreateSignature(Stream.fromIterable([base]));

      final deltaWriter = DeltaReadWriteStream();
      delta(sig, StreamReader(Stream.fromIterable([target])), deltaWriter);

      final output = BytesStreamConsumer();
      await patch(SeekableList(base), deltaWriter, output);

      expect(output.toUint8List(), target);
    });

    test('Real World', () async {
      final result = await realWorldTest();
      final got = result[0];
      final expected = result[1];
      expect(got, expected);
    });

    test('Large Test', () async {
      final base = generateRandomBytes((10 * 1024 * 1024) ~/ 1);
      final target = generateRandomBytes((10 * 1024 * 1024) ~/ 1);
      debugger();
      final sig = await testCreateSignature(Stream.fromIterable([base]));

      final deltaReadWriteStream = DeltaReadWriteStream();
      await delta(sig, StreamReader(Stream.fromIterable([target])),
          deltaReadWriteStream);

      final output = BytesStreamConsumer();
      await patch(SeekableList(base), deltaReadWriteStream, output);

      expect(output.toUint8List(), target);
      debugger();
    });
  });
}

Future<List<Uint8List>> realWorldTest() async {
  var base = File('./test/testdata/book.old').openRead();
  final sig = await testCreateSignature(base);

  final targetFilePath = './test/testdata/book.new';
  final targetReader = await FileReader.fromPath(targetFilePath);
  final deltaReadWriteStream = DeltaReadWriteStream();
  delta(sig, targetReader, deltaReadWriteStream);

  final output = BytesStreamConsumer();
  final sink = IOSink(output);
  final baseReader = await File('./test/testdata/book.old').open();
  await patchWithBaseFile(baseReader, deltaReadWriteStream, sink);

  final expected = File('./test/testdata/book.new').readAsBytesSync();
  final got = output.toUint8List();
  return <Uint8List>[got, expected];
}
