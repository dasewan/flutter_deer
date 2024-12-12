import 'package:fluro/fluro.dart';
import 'package:myapp9/pages/login2/login_page.dart';
import 'package:myapp9/pages/login2/login_pin_page.dart';
import 'package:myapp9/routers/i_router.dart';

import '../login_phone_page.dart';
import '../update_password_page.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String loginPhonePage = '/loginPhone';
  static String loginPinPage = '/loginPin';
  static String updatePasswordPage = '/login/updatePassword';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, __) => const LoginPage()));
    router.define(loginPhonePage, handler: Handler(handlerFunc: (_, __) => const LoginPhonePage()));

    router.define(loginPinPage, handler: Handler(handlerFunc: (_, params) {
      final String? phone = params['phone']?.first;
      final String? dialCode = params['dialCode']?.first;
      final String? verificationKey = params['verificationKey']?.first;
      return LoginPinPage(
        phone: phone!,
        dialCode: dialCode!,
        verificationKey: verificationKey!,
      );
    }));
    router.define(updatePasswordPage, handler: Handler(handlerFunc: (_, __) => const UpdatePasswordPage()));
  }
}
