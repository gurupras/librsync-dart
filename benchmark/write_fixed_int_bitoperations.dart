import 'dart:typed_data';

import 'package:librsync/src/match.dart';

import 'write_fixed_int_benchmark.dart';

class FixedIntDirectBenchmark extends WriteFixedIntBenchmark {
  FixedIntDirectBenchmark()
      : super((int value, int size) {
          return fixedIntBytesUsingBitOperations(value, size, Endian.big);
        });
}

void main() {
  FixedIntDirectBenchmark().report();
}
