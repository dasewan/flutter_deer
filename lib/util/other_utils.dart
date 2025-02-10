import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/res/constant.dart';
import 'package:myapp9/util/theme_utils.dart';
import 'package:myapp9/util/toast_utils.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:sp_util/sp_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:currency_formatter/currency_formatter.dart';

class Utils {

  static String formatPhoneNumber(String phoneNumber) {
    return '${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 7)}-${phoneNumber.substring(7)}';
  }

  /// 打开链接
  static Future<void> launchWebURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Toast.show('打开链接失败！');
    }
  }

  /// 调起拨号页
  static Future<void> launchTelURL(String phone) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Toast.show('拨号失败！');
    }
  }
  /// 调起whatapp
  static Future<void> launchWhatsAppURL(String phone) async {
    final Uri uri = Uri.parse('https://wa.me/$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Toast.show('拨号失败！');
    }
  }

  static String formatPrice(String price, {MoneyFormat format = MoneyFormat.END_INTEGER}){
    return MoneyUtil.changeYWithUnit(NumUtil.getDoubleByValueStr(price) ?? 0, MoneyUnit.YUAN, format: format);
  }
  static String formatPrice2(num price){
    const CurrencyFormat euroSettings = CurrencyFormat(
      // formatter settings for euro
      code: 'ng',
      symbol: '₦',
      symbolSide: SymbolSide.left,
      thousandSeparator: ',',
      decimalSeparator: '.',
      symbolSeparator: '',
    );
    return CurrencyFormatter.format(price, euroSettings);
  }

  static KeyboardActionsConfig getKeyboardActionsConfig(BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardBarColor: ThemeUtils.getKeyboardActionsColor(context),
      actions: List.generate(list.length, (i) => KeyboardActionsItem(
        focusNode: list[i],
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(getCurrLocale() == 'zh' ? '关闭' : 'Close'),
              ),
            );
          },
        ],
      )),
    );
  }

  static String? getCurrLocale() {
    final String locale = SpUtil.getString(Constant.locale)!;
    if (locale == '') {
      return PlatformDispatcher.instance.locale.languageCode;
    }
    return locale;
  }

}

Future<T?> showElasticDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
}) {

  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: pageChild,
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 550),
    transitionBuilder: _buildDialogTransitions,
  );
}

Widget _buildDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 0.3),
        end: Offset.zero
      ).animate(CurvedAnimation(
        parent: animation,
        curve: const ElasticOutCurve(0.85),
        reverseCurve: Curves.easeOutBack,
      )),
      child: child,
    ),
  );
}

/// String 空安全处理
extension StringExtension on String? {
  String get nullSafe => this ?? '';
}


