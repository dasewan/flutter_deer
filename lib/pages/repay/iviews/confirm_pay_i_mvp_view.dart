import 'package:myapp9/mvp/mvps.dart';

abstract class ConfirmPayIMvpView implements IMvpView {
  void pay();

  Future<bool> requestOpsPermission();
}
