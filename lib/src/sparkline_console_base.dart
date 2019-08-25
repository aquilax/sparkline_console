/// Generates new sparkline.
class SparkLine {
  String _steps;
  int _stepCount;

  /// Creates new object and optionally sets the spark levels
  SparkLine([this._steps = '▁▂▃▄▅▆▇█']) {
    this._stepCount = this._steps.length;
  }

  /// Genereates sparkline for the list of numbers
  String generate(List<num> nums) {
    if (nums.isEmpty) {
      return "";
    }
    final indices = _normalize(nums);
    final buffer = StringBuffer();
    indices.forEach((index) => buffer.write(_steps[index]));
    return buffer.toString();
  }

  List<int> _normalize(List<num> nums) {
    final min =
        nums.reduce((value, element) => value > element ? element : value);
    final numsCapped = nums.map((num) => num -= min).toList();

    num max =
        numsCapped.reduce((value, element) => value < element ? element : value);
    max = max == 0 ? 1 : max;

    return numsCapped.map((n) {
      n /= max;
      n *= _stepCount;
      return n == _stepCount ? _stepCount - 1 : n.floor();
    }).toList();
  }
}
