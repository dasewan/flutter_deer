import 'package:fluro/fluro.dart';
import 'package:myapp9/pages/mine/amount_record_list_page.dart';

import '../../../routers/i_router.dart';
import '../../mine/credit_record_list_page.dart';
import '../../mine/order_page.dart';
import '../page/message_page.dart';
// import '../page/order_page.dart';
import '../page/shop_page.dart';

class ShopRouter implements IRouterProvider {
  static String shopPage = '/shop';
  static String shopSettingPage = '/shop/shopSetting';
  static String messagePage = '/shop/message';
  static String orderPage = '/shop/order';
  static String accountRecordListPage = '/shop/accountRecordListPage';
  static String creditRecordListPage = '/shop/CreditRecordListPage';
  static String addressSelectPage = '/shop/addressSelect';
  static String inputTextPage = '/shop/inputText';

  @override
  void initRouter(FluroRouter router) {
    router.define(shopPage, handler: Handler(handlerFunc: (_, __) => const ShopPage()));
    router.define(messagePage, handler: Handler(handlerFunc: (_, __) => const MessagePage()));
    router.define(orderPage, handler: Handler(handlerFunc: (_, __) => const OrderPage()));
    router.define(accountRecordListPage, handler: Handler(handlerFunc: (_, __) => const AccountRecordListPage()));
    router.define(creditRecordListPage, handler: Handler(handlerFunc: (_, __) => const CreditRecordListPage()));
  }
}
