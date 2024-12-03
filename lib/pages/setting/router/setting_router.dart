import 'package:fluro/fluro.dart';

import '../../../routers/i_router.dart';
import '../page/about_page.dart';
import '../page/account_manager_page.dart';
import '../page/locale_page.dart';
import '../page/setting_page.dart';
import '../page/theme_page.dart';

class SettingRouter implements IRouterProvider {
  static String settingPage = '/setting';
  static String aboutPage = '/setting/about';
  static String themePage = '/setting/theme';
  static String localePage = '/setting/locale';
  static String accountManagerPage = '/setting/accountManager';

  @override
  void initRouter(FluroRouter router) {
    router.define(settingPage, handler: Handler(handlerFunc: (_, __) => const SettingPage()));
    router.define(aboutPage, handler: Handler(handlerFunc: (_, __) => const AboutPage()));
    router.define(themePage, handler: Handler(handlerFunc: (_, __) => const ThemePage()));
    router.define(localePage, handler: Handler(handlerFunc: (_, __) => const LocalePage()));
    router.define(accountManagerPage, handler: Handler(handlerFunc: (_, __) => const AccountManagerPage()));
  }
}
