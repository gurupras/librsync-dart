import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:librsync/signature.dart';

import 'write_fixed_int_benchmark.dart';

class ParseIntBenchmark extends BenchmarkBase {
  final int Function(List<int>) convert;

  ParseIntBenchmark(String name, this.convert)
      : super("ParseIntBenchmark($name)");

  @override
  void run() {
    final expected = 4;
    final byteArrays = <List<int>>[
      <int>[4],
      <int>[0, 4],
      <int>[0, 0, 0, 4],
      <int>[0, 0, 0, 0, 0, 0, 0, 4]
    ];

    final sizes = [1, 2, 4, 8];
    for (int idx = 0; idx < 1000; idx++) {
      for (var sizeIdx = 0; sizeIdx < sizes.length; sizeIdx++) {
        final got = convert(byteArrays[sizeIdx]);
        if (got != expected) {
          throw 'Conversion failed. Expected=$expected Got=$got';
        }
      }
    }
  }
}

class ParseFixedIntBitWise extends ParseIntBenchmark {
  ParseFixedIntBitWise() : super('bit-wise', parseIntBitWise);
}

class ParseFixedIntWithByteData extends ParseIntBenchmark {
  ParseFixedIntWithByteData() : super('ByteData', parseIntUsingByteData);
}

void main() {
  ParseFixedIntBitWise().report();
  ParseFixedIntWithByteData().report();
}
