import 'package:fluro/fluro.dart';
import 'package:myapp9/pages/html/page/about_us_page.dart';
import 'package:myapp9/pages/html/page/help_page.dart';
import 'package:myapp9/routers/i_router.dart';

import '../page/credit_score_page.dart';


class HtmlRouter implements IRouterProvider {
  static String creditScorePage = '/credit_score';
  static String helpPage = '/help';
  static String aboutUsPage = '/about_us';

  @override
  void initRouter(FluroRouter router) {
    router.define(creditScorePage, handler: Handler(handlerFunc: (_, __) => CreditScorePage()));
    router.define(helpPage, handler: Handler(handlerFunc: (_, __) => HelpPage()));
    router.define(aboutUsPage, handler: Handler(handlerFunc: (_, __) => AboutUsPage()));
  }
}
