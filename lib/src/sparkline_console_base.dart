/// Generates new sparkline.
class SparkLine {
  String steps;
  int stepCount;

  SparkLine([String this.steps = '▁▂▃▄▅▆▇█']) {
    this.stepCount = this.steps.length;
  }

  String generate(List<num> nums) {
    if (nums.length == 0) {
      return "";
    }
    var indices = normalize(nums);
    var buffer = new StringBuffer();
    for (var index in indices) {
      buffer.write(steps[index]);
    }
    return buffer.toString();
  }

  List<int> normalize(List<num> nums) {
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
      n *= stepCount;
      indices.add(n == stepCount ? stepCount - 1 : n.floor());
    }
    return indices;
  }
}
