import 'package:librsync/src/match.dart';

import 'fixed_int_benchmark.dart';

class FixedIntByteData extends FixedIntBenchmark {
  FixedIntByteData() : super(fixedIntBytesUsingByteData);
}

void main() {
  FixedIntByteData().report();
}
