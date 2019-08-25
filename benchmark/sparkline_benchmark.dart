// Import BenchmarkBase class.
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:sparkline_console/src/sparkline_console_base.dart';

// Create a new benchmark by extending BenchmarkBase
class SparklineBenchmark extends BenchmarkBase {
  const SparklineBenchmark() : super('Template');

  static void main() {
    SparklineBenchmark().report();
  }

  @override
  void run() {
    SparkLine().generate([1, 2, 3, 4, 5, 6, 7, 8]);
  }
}

void main() {
  // Run SparklineBenchmark
  SparklineBenchmark.main();
}