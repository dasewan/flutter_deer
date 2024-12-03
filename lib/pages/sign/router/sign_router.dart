import 'package:fluro/fluro.dart';
import 'package:myapp9/pages/sign/sign_page.dart';
import 'package:myapp9/pages/sign/sign_succes_page.dart';
import 'package:myapp9/routers/i_router.dart';

class SignRouter implements IRouterProvider {
  static String sign = '/sign';
  static String signSuccess = '/sign_success';

  @override
  void initRouter(FluroRouter router) {
/*    router.define(sign, handler: Handler(handlerFunc: (_, __) {
      return const SignPage();
    }));*/

    router.define(sign, handler: Handler(handlerFunc: (_, params) {
      print(params['productId']);
      final String? id = params['productId']?.first;
      print(id);
      return SignPage(
        productId: id!,
      );
    }));

    router.define(signSuccess, handler: Handler(handlerFunc: (_, params) {
      final String tip1 = params['tip1']!.first;
      final String tip2 = params['tip2']!.first;
      final String tip3 = params['tip3']!.first;
      final String tip4 = params['tip4']!.first;
      return SignSuccessPage(tip1: tip1, tip2: tip2, tip3: tip3, tip4: tip4);
    }));
  }
}
