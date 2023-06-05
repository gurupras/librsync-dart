import 'dart:developer';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:librsync/delta.dart';
import 'package:librsync/patch.dart';
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
    return Uint8List.fromList(buf.sublist(pos, pos + count));
  }
}

void main() {
  group('librsync', () {
    test('end-to-end', () async {
      final base = toBytes("Hello World");
      final target = toBytes("Hollywood");

      final sig = await testCreateSignature(Stream.fromIterable([base]));

      final deltaWriter = BytesStreamConsumer();
      await delta(
          sig, ChunkedStreamReader(Stream.fromIterable([target])), deltaWriter);

      final output = BytesStreamConsumer();
      await patch(SeekableList(base),
          Stream.fromIterable([deltaWriter.toUint8List()]), output);

      expect(output.toUint8List(), target);
    });

    test('Large Test', () async {
      final base = generateRandomBytes((1 * 1024 * 1024) ~/ 1);
      final target = generateRandomBytes((1 * 1024 * 1024) ~/ 1);
      debugger();
      final sig = await testCreateSignature(Stream.fromIterable([base]));

      final deltaWriter = BytesStreamConsumer();
      await delta(
          sig, ChunkedStreamReader(Stream.fromIterable([target])), deltaWriter);

      final output = BytesStreamConsumer();
      await patch(SeekableList(base),
          Stream.fromIterable([deltaWriter.toUint8List()]), output);

      expect(output.toUint8List(), target);
      debugger();
    });
  });
}
