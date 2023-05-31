import 'dart:typed_data';

import 'package:librsync/delta.dart';
import 'package:librsync/src/op.dart';

typedef MatchKind = int;

const MatchKind matchKindLiteral = 0;
const MatchKind matchKindCopy = 1;

class Match {
  MatchKind kind;
  int pos, len;
  Writer output;
  int outputBufferSize;
  List<int> litBuf;

  Match(
      {required this.output,
      required this.litBuf,
      required this.outputBufferSize})
      : kind = 0,
        pos = 0,
        len = 0;

  Future<void> flush() async {
    if (len == 0) {
      return;
    }
    final posSize = intSize(pos);
    final lenSize = intSize(len);

    Op cmd = 0;

    switch (kind) {
      case matchKindCopy:
        {
          switch (posSize) {
            case 1:
              cmd = OP_COPY_N1_N1;
              break;
            case 2:
              cmd = OP_COPY_N2_N1;
              break;
            case 4:
              cmd = OP_COPY_N4_N1;
              break;
            case 8:
              cmd = OP_COPY_N8_N1;
              break;
          }

          switch (lenSize) {
            case 2:
              cmd += 1;
              break;
            case 4:
              cmd += 2;
              break;
            case 8:
              cmd += 3;
              break;
          }

          final byteBuilder = BytesBuilder(copy: false);
          byteBuilder.add(fixedIntBytes(cmd, 1));
          byteBuilder.add(fixedIntBytes(pos, posSize));
          byteBuilder.add(fixedIntBytes(len, lenSize));
          await output.write(byteBuilder.takeBytes());
          break;
        }
      case matchKindLiteral:
        {
          cmd = OP_LITERAL_N1;
          switch (lenSize) {
            case 1:
              cmd = OP_LITERAL_N1;
              break;
            case 2:
              cmd = OP_LITERAL_N2;
              break;
            case 4:
              cmd = OP_LITERAL_N4;
              break;
            case 8:
              cmd = OP_LITERAL_N8;
              break;
          }

          final byteBuilder = BytesBuilder(copy: false);
          byteBuilder.add(fixedIntBytes(cmd, 1));
          byteBuilder.add(fixedIntBytes(len, lenSize));
          byteBuilder.add(litBuf);
          await output.write(byteBuilder.takeBytes());
          litBuf.clear();
          break;
        }
    }
    pos = 0;
    len = 0;
  }

  Future<void> add(MatchKind kind, int pos, int len) async {
    if (len != 0 && this.kind != kind) {
      await flush();
    }

    this.kind = kind;

    switch (kind) {
      case matchKindLiteral:
        {
          litBuf.addAll(fixedIntBytes(pos, 1));
          this.len += 1;
          if (this.len >= outputBufferSize) {
            await flush();
          }
          break;
        }
      case matchKindCopy:
        {
          if (this.pos + this.len != pos) {
            await flush();
            this.pos = pos;
            this.len = len;
          } else {
            this.len += len;
          }
          break;
        }
    }
  }
}

int intSize(int d) {
  if (d == d.clamp(0, 0xFF)) {
    return 1;
  } else if (d == d.clamp(0, 0xFFFF)) {
    return 2;
  } else if (d == d.clamp(0, 0xFFFFFFFF)) {
    return 4;
  } else {
    return 8;
  }
}

Uint8List fixedIntBytes(int value, int size) {
  final byteData = ByteData(size);
  switch (size) {
    case 1:
      byteData.setUint8(0, value);
      break;
    case 2:
      byteData.setUint16(0, value, Endian.big);
      break;
    case 4:
      byteData.setUint32(0, value, Endian.big);
      break;
    case 8:
      byteData.setUint64(0, value, Endian.big);
      break;
  }
  return byteData.buffer.asUint8List();
}

Future<void> writeFixedInt(Writer writer, int value, int size) async {
  return writer.write(fixedIntBytes(value, size));
}
