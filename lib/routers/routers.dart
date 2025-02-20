import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myapp8/account/account_router.dart';
import 'package:myapp8/goods/goods_router.dart';
import 'package:myapp8/home/home_page.dart';
import 'package:myapp8/home/webview_page.dart';
import 'package:myapp8/login/login_router.dart';
import 'package:myapp8/order/order_router.dart';
import 'package:myapp8/routers/i_router.dart';
import 'package:myapp8/routers/not_found_page.dart';
import 'package:myapp8/setting/setting_router.dart';
import 'package:myapp8/shop/shop_router.dart';
import 'package:myapp8/statistics/statistics_router.dart';
import 'package:myapp8/store/store_router.dart';

class Routes {

  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        debugPrint('未找到目标页');
        return const NotFoundPage();
      });

    router.define(home, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const Home()));
    
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first ?? '';
      final String url = params['url']?.first ?? '';
      return WebViewPage(title: title, url: url);
    }));

    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(ShopRouter());
    _listRouter.add(LoginRouter());
    _listRouter.add(GoodsRouter());
    _listRouter.add(OrderRouter());
    _listRouter.add(StoreRouter());
    _listRouter.add(AccountRouter());
    _listRouter.add(SettingRouter());
    _listRouter.add(StatisticsRouter());
  
    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }
    _listRouter.forEach(initRouter);
  }
}
