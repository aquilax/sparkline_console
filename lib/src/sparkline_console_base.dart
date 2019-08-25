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
    var indices = _normalize(nums);
    var buffer = StringBuffer();
    for (var index in indices) {
      buffer.write(_steps[index]);
    }
    return buffer.toString();
  }

  List<int> _normalize(List<num> nums) {
    List<int> indices = [];
    num min =
        nums.reduce((value, element) => value > element ? element : value);
    for (var i = 0; i < nums.length; i++) {
      nums[i] -= min;
    }
    num max =
        nums.reduce((value, element) => value < element ? element : value);
    max = max == 0 ? 1 : max;
    for (var n in nums) {
      n /= max;
      n *= _stepCount;
      indices.add(n == _stepCount ? _stepCount - 1 : n.floor());
    }
    return indices;
  }
}
