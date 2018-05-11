# sparkline_console

[![Build Status](https://travis-ci.org/aquilax/sparkline_console.svg?branch=master)](https://travis-ci.org/aquilax/sparkline_console)

A library for generating command line sparklines.

Adapted from [this](https://github.com/joliv/spark) Go library.

## Usage

A simple usage example:

    import 'package:sparkline_console/sparkline_console.dart';

    main() {
      var sparkLine = new SparkLine();
      print(sparkLine.generate([1, 2, 3, 4, 5, 6, 7, 8])); // ▁▂▃▄▅▆▇█
    }
