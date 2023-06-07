import 'dart:async';
import 'dart:typed_data';

import 'package:librsync/src/reader_writer.dart';

class DeltaStream implements Writer {
  Future<void> Function(Uint8List data) onData;

  DeltaStream({required this.onData});

  @override
  Future<void> write(Uint8List data) async {
    await onData(data);
  }
}

class DeltaReadWriteStream implements Reader, Writer {
  final StreamController<Uint8List> _controller;
  late final StreamReader _reader;

  DeltaReadWriteStream() : _controller = StreamController() {
    _reader = StreamReader(_controller.stream);
  }

  @override
  Future<List<int>> read(int size) {
    return _reader.read(size);
  }

  @override
  Future<Uint8List> readBytes(int size) {
    return _reader.readBytes(size);
  }

  @override
  Future<void> write(Uint8List bytes) async {
    _controller.add(bytes);
  }
}
