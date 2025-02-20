import 'package:flutter/material.dart';
import 'package:myapp8/setting/provider/theme_provider.dart';
import 'package:myapp8/statistics/page/goods_statistics_page.dart';
import 'package:myapp8/statistics/page/order_statistics_page.dart';
import 'package:myapp8/statistics/page/statistics_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final Map<String, Widget> map = <String, Widget>{};
  map['statistics_page'] = const StatisticsPage();
  map['order_statistics_page'] = const OrderStatisticsPage(1);
  map['goods_statistics_page'] = const GoodsStatisticsPage();
  
  group('statistics => 检测页面可点击目标大小是否大于44 * 44', () {
    final ThemeData themeData = ThemeProvider().getTheme();
    map.forEach((name, page) {
      testWidgets(name, (WidgetTester tester) async {
        final SemanticsHandle handle = tester.ensureSemantics();
        await tester.pumpWidget(MaterialApp(home: page, theme: themeData,));
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        handle.dispose();
      }, skip: name == 'order_statistics_page');
    });
  });

  group('statistics => 检测页面可点击目标是否都有语义', () {
    final ThemeData themeData = ThemeProvider().getTheme();
    map.forEach((name, page) {
      testWidgets(name, (WidgetTester tester) async {
        final SemanticsHandle handle = tester.ensureSemantics();
        await tester.pumpWidget(MaterialApp(home: page, theme: themeData,));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        handle.dispose();
      });
    });
  });
}
