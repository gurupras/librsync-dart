import 'package:async/async.dart';
import 'package:librsync/delta.dart';
import 'package:librsync/patch.dart';
import 'package:test/test.dart';

import '../test/bytes_stream_consumer.dart';
import '../test/circbuf/circbuf_test.dart';
import '../test/librsync_test.dart';
import '../test/signature_test.dart';

void main() async {
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
}
