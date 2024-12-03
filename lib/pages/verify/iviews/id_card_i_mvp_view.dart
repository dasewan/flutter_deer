import 'package:myapp9/mvp/mvps.dart';

abstract class IdCardIMvpView implements IMvpView {
  // void onCreateSuccess(CreateDBorrowEntityEntity createDBorrowEntityEntity);
  void onCreateSuccess(String route);

  void onCreateRefuse(String message);
}
