import 'package:benchmark_harness/benchmark_harness.dart';

import '../test/librsync_test.dart';

class LibRsyncBenchmark extends AsyncBenchmarkBase {
  LibRsyncBenchmark() : super("end-to-end");

  @override
  Future<void> run() async {
    await realWorldTest();
  }
}

void main() {
  LibRsyncBenchmark().report();
}
