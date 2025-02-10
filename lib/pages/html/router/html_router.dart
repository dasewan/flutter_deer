import 'package:fluro/fluro.dart';
import 'package:myapp9/routers/i_router.dart';

import '../page/credit_score_page.dart';


class HtmlRouter implements IRouterProvider {
  static String creditScorePage = '/credit_score';

  @override
  void initRouter(FluroRouter router) {
    router.define(creditScorePage, handler: Handler(handlerFunc: (_, __) => CreditScorePage()));
  }
}
