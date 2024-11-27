
import 'package:flutter/material.dart';
import 'package:myapp9/home/home_page.dart';
import 'package:myapp9/main.dart';
import 'package:myapp9/res/constant.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/goods/goods.dart
void main() {
  enableFlutterDriverExtension();
  Constant.isDriverTest = true;
  runApp(MyApp(home: const Home()));
}
