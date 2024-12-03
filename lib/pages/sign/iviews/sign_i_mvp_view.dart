
import 'package:myapp9/mvp/mvps.dart';
import 'package:myapp9/providers/sign_provider.dart';


abstract class SignIMvpView implements IMvpView {

SignProvider get provider;

  void signSuccess(String tip1, String tip2, String tip3, String tip4);
  Future<bool> requestOpsPermission();
}

