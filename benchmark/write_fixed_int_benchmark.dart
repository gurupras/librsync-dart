import 'dart:typed_data';

import 'package:benchmark_harness/benchmark_harness.dart';

typedef CreateFixedIntInstance = Uint8List Function(int, int);

class WriteFixedIntBenchmark extends BenchmarkBase {
  final CreateFixedIntInstance convert;

  const WriteFixedIntBenchmark(this.convert) : super('FixedInt');

  @override
  void run() {
    final expectedValues = [
      <int>[4],
      <int>[0, 4],
      <int>[0, 0, 0, 4],
      <int>[0, 0, 0, 0, 0, 0, 0, 4]
    ];

    final sizes = [1, 2, 4, 8];
    for (int idx = 0; idx < 1000; idx++) {
      for (var sizeIdx = 0; sizeIdx < sizes.length; sizeIdx++) {
        final size = sizes[sizeIdx];
        final result = convert(4, size);
        final expected = expectedValues[sizeIdx];
        if (result.length != expected.length) {
          throw 'Sizes don\'t match';
        }
        result.asMap().forEach((key, got) {
          if (got != expected[key]) {
            throw 'Value did not match';
          }
        });
      }
    }
  }

  @override
  void setup() {}

  @override
  void teardown() {}
}
