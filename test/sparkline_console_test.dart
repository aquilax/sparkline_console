import 'package:sparkline_console/sparkline_console.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('generates spark line', () {
      List<num> points = [1, 2, 3, 4, 5, 6, 7, 8];
      expect(new SparkLine().generate(points), equals('▁▂▃▄▅▆▇█'));
    });

    test('generates custom spark line', () {
      List<num> points = [1, 2, 3, 4, 5, 6, 7, 8];
      expect(new SparkLine('0123456789').generate(points), equals('01245789'));
    });

    test('empty list generates empty response', () {
      List<num> points = [];
      expect(new SparkLine().generate(points), equals(''));
    });

    test('works with negative numbers', () {
      List<num> points = [-1, 2, -3, 4, -5, 6, -7, 8];
      expect(new SparkLine('0123456789').generate(points), equals('46271809'));
    });

  });
}
