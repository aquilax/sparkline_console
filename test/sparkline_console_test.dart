import 'package:sparkline_console/sparkline_console.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('generates spark line', () {
      var points = [1, 2, 3, 4, 5, 6, 7, 8];
      expect(new SparkLine().generate(points), equals('▁▂▃▄▅▆▇█'));
    });

    test('generates custom spark line', () {
      var points = [1, 2, 3, 4, 5, 6, 7, 8];
      expect(new SparkLine('0123456789').generate(points), equals('01245789'));
    });
  });
}
