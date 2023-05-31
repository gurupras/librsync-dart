import 'dart:math';

abstract class Buffer {
  /// Write writes up to [buf.length] bytes to the internal ring, overriding older
  /// data if necessary. Returns the number of bytes written and any occasional
  /// error.
  int write(List<int> buf);

  /// WriteByte writes a single byte into the buffer.
  void writeByte(int c);

  /// Size returns the size of the buffer.
  int size();

  /// TotalWritten provides the total number of bytes written.
  int totalWritten();

  /// Bytes provides a slice of the bytes written. This slice should not be written to.
  /// The underlying list may point to data that will be overwritten by a subsequent
  /// call to Bytes. It shall do no allocation.
  List<int> bytes();

  /// Get returns a single byte out of the buffer, at the given position.
  int get(int i);

  /// Reset resets the buffer so it has no content.
  void reset();

  /// String returns the contents of the buffer as a string.
  @override
  String toString();
}

class BaseBuffer implements Buffer {
  List<int> data;
  List<int> out;
  int maxSize;
  int writeCursor;
  int written;

  BaseBuffer(this.maxSize)
      : data = List<int>.filled(maxSize, 0),
        out = List<int>.filled(maxSize, 0),
        writeCursor = 0,
        written = 0;

  int get bufferSize => maxSize;

  @override
  int size() {
    return maxSize;
  }

  @override
  int totalWritten() {
    return written;
  }

  @override
  int get(int i) {
    return data[i];
  }

  @override
  List<int> bytes() {
    if (written >= maxSize && writeCursor == 0) {
      return data;
    } else if (written > maxSize) {
      out.setAll(0, data.getRange(writeCursor, maxSize));
      out.setAll(maxSize - writeCursor, data.getRange(0, writeCursor));
      return out;
    } else {
      return data.sublist(0, writeCursor);
    }
  }

  @override
  void reset() {
    writeCursor = 0;
    written = 0;
  }

  @override
  String toString() {
    return String.fromCharCodes(bytes());
  }

  @override
  void writeByte(int c) {
    write(<int>[c]);
  }

  @override
  int write(List<int> buf) {
    int n = buf.length;
    written += n;

    if (n > maxSize) {
      buf = buf.sublist(n - maxSize);
    }

    int remain = maxSize - writeCursor;
    data.setAll(writeCursor, buf.sublist(0, min(buf.length, remain)));
    if (buf.length > remain) {
      data.setAll(0, buf.sublist(remain));
    }

    return buf.length;
  }
}
