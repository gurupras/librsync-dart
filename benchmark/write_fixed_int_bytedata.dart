import 'package:librsync/src/match.dart';

import 'write_fixed_int_benchmark.dart';

class FixedIntByteData extends WriteFixedIntBenchmark {
  FixedIntByteData() : super(fixedIntBytesUsingByteData);
}

void main() {
  FixedIntByteData().report();
}
