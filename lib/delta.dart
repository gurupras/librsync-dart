import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:librsync/patch.dart';
import 'package:librsync/signature.dart';
import 'package:librsync/src/circbuf/circbuf.dart';
import 'package:librsync/src/match.dart';
import 'package:librsync/src/op.dart';
import 'package:librsync/src/reader_writer.dart';
import 'package:librsync/src/rollsum.dart';

const outputBufferSize = 16 * 1024 * 1024;

Future<void> delta(SignatureType sig, Reader input, Writer output,
    {int maxBufferSize = outputBufferSize}) {
  final bytesBuilder = BytesBuilder(copy: false);
  return _computeDelta(sig, input, output, bytesBuilder, maxBufferSize);
}

Future<void> _computeDelta(SignatureType sig, Reader input, Writer output,
    BytesBuilder bytesBuilder, int litBufSize) async {
  await writeFixedInt(output, deltaMagic, 4);

  int prevByte = 0;

  final uint8ListEquality = ListEquality().equals;

  final m = Match(
      output: output, bytesBuilder: bytesBuilder, outputBufferSize: litBufSize);

  Rollsum weakSum = Rollsum();
  final block = newBuffer(sig.blockLen);
  for (;;) {
    int next = 0;
    try {
      next = await readFixedInt(input, 1);
    } catch (e) {
      if (e == 'EOF') {
        break;
      } else {
        rethrow;
      }
    }
    if (block.totalWritten() > 0) {
      prevByte = block.get(0);
    }
    block.writeByte(next);
    weakSum.rollin(next);

    if (weakSum.count < sig.blockLen) {
      continue;
    }

    if (weakSum.count > sig.blockLen) {
      await m.add(matchKindLiteral, prevByte, 1);
      weakSum.rollout(prevByte);
    }

    final digest = weakSum.digest();
    if (sig.weak2block.containsKey(digest)) {
      final blockIdx = sig.weak2block[digest]!;
      final strong2 =
          await calcStrongSum(block.bytes(), sig.sigType, sig.strongLen);

      if (uint8ListEquality(sig.strongSigs[blockIdx], strong2)) {
        weakSum.reset();
        block.reset();
        await m.add(matchKindCopy, blockIdx * sig.blockLen, sig.blockLen);
      }
    }
  }

  for (var b in block.bytes()) {
    await m.add(matchKindLiteral, b, 1);
  }

  await m.flush();

  print('Finished delta. Writing OP_END (1 byte)');
  await writeFixedInt(output, OP_END, 1);
}

Future<void> writeFixedInt(Writer writer, int value, int size) async {
  return writer.write(fixedIntBytes(value, size));
}
