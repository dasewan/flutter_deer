import 'package:fluro/fluro.dart';
import 'package:myapp9/routers/i_router.dart';

import '../privacy_page.dart';

class PrivacyRouter implements IRouterProvider {
  static String privacyPage = '/privacy';

  @override
  void initRouter(FluroRouter router) {
    router.define(privacyPage, handler: Handler(handlerFunc: (_, __) => PrivacyPage()));
  }
}
