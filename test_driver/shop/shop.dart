
import 'package:flutter/material.dart';
import 'package:myapp8/home/home_page.dart';
import 'package:myapp8/main.dart';
import 'package:myapp8/res/constant.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/shop/shop.dart
void main() {
  enableFlutterDriverExtension();
  Constant.isDriverTest = true;
  runApp(MyApp(home: const Home()));
}
