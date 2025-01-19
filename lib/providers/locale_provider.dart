import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/res/constant.dart';
import 'package:sp_util/sp_util.dart';
import 'dart:ui'; // 导入dart:ui库来获取设备语言和地区信息

class LocaleProvider extends ChangeNotifier {

  // 获取当前的语言和地区设置
  Locale? get locale {
    // 从SharedPreferences中获取存储的语言设置
    final String storedLocale = SpUtil.getString(Constant.locale) ?? '';

    // 如果没有存储的设置，使用设备默认语言和地区
    if (storedLocale.isEmpty) {
      // 获取设备的当前语言和国家
      Locale deviceLocale = window.locale;
      String languageCode = deviceLocale.languageCode; // 获取语言代码（如en, zh等）
      String countryCode = deviceLocale.countryCode ?? ''; // 获取国家代码（如US, CN等）

      // 如果国家代码为空，使用默认的国家代码（如US）
      if (countryCode.isEmpty) {
        countryCode = 'US';
      }
      // 返回设备的语言和国家设置
      return Locale(languageCode, countryCode);
    }

    // 如果有存储的语言设置，按其值进行匹配
    switch (storedLocale) {
      case 'ar':
        return const Locale('ar', 'SA');
      case 'es':
        return const Locale('es', 'ES');
      case 'fr':
        return const Locale('fr', 'FR');
      case 'id':
        return const Locale('id', 'ID');
      case 'ja':
        return const Locale('ja', 'JP');
      case 'pt':
        return const Locale('pt', 'PT');
      case 'ru':
        return const Locale('ru', 'RU');
      case 'vi':
        return const Locale('vi', 'VN');
      case 'zh':
        return const Locale('zh', 'CN');
      case 'en':
        return const Locale('en', 'US');
      default:
        return const Locale('en', 'US');
    }
  }

  // 设置新的语言
  void setLocale(String locale) {
    SpUtil.putString(Constant.locale, locale);
    notifyListeners();
  }

}
