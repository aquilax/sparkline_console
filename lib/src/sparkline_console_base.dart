/// Generates new sparkline.
class SparkLine {
  final String _steps;
  int _stepCount;

  /// Creates new object and optionally sets the spark levels
  SparkLine([this._steps = '▁▂▃▄▅▆▇█']) {
    _stepCount = _steps.length;
  }

  /// Genereates sparkline for the list of numbers
  String generate(List<num> nums) {
    if (nums.isEmpty) {
      return '';
    }
    final indices = _normalize(nums);
    final buffer = StringBuffer();
    for (final index in indices) {
      buffer.write(_steps[index]);
    }
    return buffer.toString();
  }

  List<int> _normalize(List<num> nums) {
    final min =
        nums.reduce((value, element) => value > element ? element : value);
    final numsCapped = nums.map((numb) => numb -= min).toList();

    var max = numsCapped
        .reduce((value, element) => value < element ? element : value);
    max = max == 0 ? 1 : max;

    return numsCapped.map((n) {
      n /= max;
      n *= _stepCount;
      return n == _stepCount ? _stepCount - 1 : n.floor();
    }).toList();
  }
}
