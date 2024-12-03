import 'package:myapp9/mvp/mvps.dart';
import 'package:myapp9/providers/index_first_provider.dart';
import 'package:myapp9/providers/user_provider.dart';

abstract class IndexFirstIMvpView implements IMvpView {
  IndexFirstProvider get provider;
  void createBorrowSuccess();
  void goSwipper();
  void goVerifyList();
  void goSign();
  void goLiveness();
}
