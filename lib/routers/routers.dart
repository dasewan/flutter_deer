import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:myapp9/routers/i_router.dart';
import 'package:myapp9/routers/not_found_page.dart';


import 'package:myapp9/pages/home/home_page.dart';
import 'package:myapp9/pages/liveness/router/liveness_router.dart';
import 'package:myapp9/pages/login/router/login_router.dart';
import 'package:myapp9/pages/repay/router/repay_router.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import '../pages/home/webview_page.dart';
import '../pages/privacy/router/privacy_router.dart';
import '../pages/setting/router/setting_router.dart';
import '../pages/shop/router/shop_router.dart';

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
    _listRouter.add(LoginRouter());
    _listRouter.add(VerifyRouter());
    _listRouter.add(SignRouter());
    _listRouter.add(LivenessRouter());
    _listRouter.add(RepayRouter());
    _listRouter.add(ShopRouter());
    _listRouter.add(SettingRouter());
    _listRouter.add(PrivacyRouter());

  
    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }
    _listRouter.forEach(initRouter);
  }
}
