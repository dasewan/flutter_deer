import 'package:fluro/fluro.dart';
import 'package:myapp9/pages/liveness/liveness_page.dart';
import 'package:myapp9/pages/sign/sign_succes_page.dart';
import 'package:myapp9/routers/i_router.dart';

class LivenessRouter implements IRouterProvider {
  static String liveness = '/liveness';
  static String livenessSuccess = '/liveness_success';

  @override
  void initRouter(FluroRouter router) {
/*    router.define(sign, handler: Handler(handlerFunc: (_, __) {
      return const SignPage();
    }));*/

    router.define(liveness, handler: Handler(handlerFunc: (_, params) {
      print(params['productId']);
      final String? id = params['productId']?.first;
      print(id);
      return LivenessPage(
        productId: id!,
      );
    }));

    router.define(livenessSuccess, handler: Handler(handlerFunc: (_, params) {
      final String tip1 = params['tip1']!.first;
      final String tip2 = params['tip2']!.first;
      final String tip3 = params['tip3']!.first;
      final String tip4 = params['tip4']!.first;
      return SignSuccessPage(tip1: tip1, tip2: tip2, tip3: tip3, tip4: tip4);
    }));
  }
}
