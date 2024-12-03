import 'package:fluro/fluro.dart';
import 'package:myapp9/pages/login/login_page.dart';
import 'package:myapp9/routers/i_router.dart';

import '../update_password_page.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String updatePasswordPage = '/login/updatePassword';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, __) => const LoginPage()));
    router.define(updatePasswordPage, handler: Handler(handlerFunc: (_, __) => const UpdatePasswordPage()));
  }
}
