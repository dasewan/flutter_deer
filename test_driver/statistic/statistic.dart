
import 'package:flutter/material.dart';
import 'package:myapp9/home/home_page.dart';
import 'package:myapp9/main.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/statistic/statistic.dart
void main() {
  enableFlutterDriverExtension();
  runApp(MyApp(home: const Home()));
}
