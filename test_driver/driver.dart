
import 'package:myapp8/main.dart' as app;
import 'package:myapp8/res/constant.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 集成测试运行 flutter drive --profile --target=test_driver/driver.dart （模拟器去除--profile）
/// 集成测试暂不支持拖动、长按等方式。 https://github.com/flutter/flutter/issues/27552
/// 其他问题记录：https://github.com/flutter/flutter/issues/12561
void main() {
  enableFlutterDriverExtension();
  Constant.isDriverTest = true;
  app.main();
}
