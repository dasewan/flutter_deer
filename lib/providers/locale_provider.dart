import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/res/constant.dart';
import 'package:sp_util/sp_util.dart';

class LocaleProvider extends ChangeNotifier {

  Locale? get locale {
    final String locale = SpUtil.getString(Constant.locale) ?? '';
    switch(locale) {
      case 'zh':
        return const Locale('zh', 'CN');
      case 'en':
        return const Locale('en', 'US');
      default:
        return const Locale('en', 'US');
    }
  }

  void setLocale(String locale) {
    SpUtil.putString(Constant.locale, locale);
    notifyListeners();
  }

}
