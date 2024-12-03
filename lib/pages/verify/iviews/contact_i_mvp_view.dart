import 'package:myapp9/mvp/mvps.dart';

abstract class ContactIMvpView implements IMvpView {
  // void onCreateSuccess(CreateDBorrowEntityEntity createDBorrowEntityEntity);
  void onCreateSuccess(String route);

  Future<bool> requestOpsPermission();
}
