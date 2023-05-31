import 'package:librsync/src/circbuf/anybuf.dart';
import 'package:librsync/src/circbuf/basebuf.dart';
import 'package:librsync/src/circbuf/po2buf.dart';

Buffer newBuffer(int size) {
  if (size <= 0) {
    throw 'Size msut be positive';
  }
  if ((size & (size - 1)) == 0) {
    return PO2Buffer(size);
  }
  return AnyBuffer(size);
}
