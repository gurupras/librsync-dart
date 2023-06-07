import 'package:librsync/delta.dart';
import 'package:librsync/patch.dart';
import 'package:librsync/src/delta_stream.dart';
import 'package:librsync/src/reader_writer.dart';
import 'package:test/test.dart';

import '../test/bytes_stream_consumer.dart';
import '../test/circbuf/circbuf_test.dart';
import '../test/librsync_test.dart';
import '../test/signature_test.dart';

void main() async {
  final base = toBytes("Hello World");
  final target = toBytes("Hollywood");

  final sig = await testCreateSignature(Stream.fromIterable([base]));

  final deltaReadWriter = DeltaReadWriteStream();
  delta(sig, StreamReader(Stream.fromIterable([target])), deltaReadWriter);

  final output = BytesStreamConsumer();
  await patch(SeekableList(base), deltaReadWriter, output);

  expect(output.toUint8List(), target);
}
