import 'dart:core';
import 'dart:typed_data';

import 'package:librsync/src/circbuf/basebuf.dart';

class AnyBuffer extends BaseBuffer {
  AnyBuffer(int size) : super(size);

  @override
  int write(Uint8List buf) {
    final n = super.write(buf);
    writeCursor = ((writeCursor + n) % maxSize);
    return buf.length;
  }

  @override
  void writeByte(int c) {
    data[writeCursor] = c;
    writeCursor = ((writeCursor + 1) % maxSize);
    written++;
  }

  @override
  int get(int i) {
    if (i >= written || i >= maxSize) {
      throw Exception('Index out of bounds: $i');
    } else if (written > maxSize) {
      return data[(writeCursor + i) % maxSize];
    } else {
      return data[i];
    }
  }
}
