
import 'package:librsync/src/circbuf/basebuf.dart';

class PO2Buffer extends BaseBuffer {
  PO2Buffer(int size) : super(size);

  @override
  int write(List<int> buf) {
    final n = super.write(buf);
    writeCursor = (writeCursor + n) & (maxSize - 1);
    return buf.length;
  }

  @override
  void writeByte(int c) {
    data[writeCursor] = c;
    writeCursor = (writeCursor + 1) & (maxSize - 1);
    written++;
  }

  @override
  int get(int i) {
    if (i >= written || i >= maxSize) {
      throw ArgumentError('Index out of bounds: $i');
    } else if (written > maxSize) {
      return data[(writeCursor + i) & (maxSize - 1)];
    } else {
      return data[i];
    }
  }
}
