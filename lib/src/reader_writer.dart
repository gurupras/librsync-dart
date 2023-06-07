import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';

abstract interface class Writer {
  Future<void> write(Uint8List bytes);
}

class FileWriter implements Writer {
  final IOSink _sink;
  FileWriter(this._sink);

  @override
  Future<void> write(Uint8List bytes) async {
    _sink.add(bytes);
  }
}

abstract interface class Reader {
  Future<List<int>> read(int size);
  Future<Uint8List> readBytes(int size);
}

class FileReader implements Reader {
  final RandomAccessFile _raf;

  FileReader(this._raf);

  static Future<FileReader> fromPath(String path) async {
    final raf = await File(path).open();
    return FileReader(raf);
  }

  @override
  Future<List<int>> read(int size) {
    return readBytes(size);
  }

  @override
  Future<Uint8List> readBytes(int size) {
    return _raf.read(size);
  }
}

class StreamReader implements Reader {
  final ChunkedStreamReader<int> _chunkedStreamReader;

  StreamReader(Stream<List<int>> stream)
      : _chunkedStreamReader = ChunkedStreamReader(stream);

  @override
  Future<List<int>> read(int size) {
    return _chunkedStreamReader.readBytes(size);
  }

  @override
  Future<Uint8List> readBytes(int size) {
    return _chunkedStreamReader.readBytes(size);
  }
}
