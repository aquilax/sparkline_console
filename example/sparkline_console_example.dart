import 'package:sparkline_console/sparkline_console.dart';

main() {
  var sparkLine = new SparkLine();
  print(sparkLine.generate([1, 2, 3, 4, 5, 6, 7, 8])); // ▁▂▃▄▅▆▇█
}
