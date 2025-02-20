import 'package:myapp8/mvp/mvps.dart';
import 'package:myapp8/shop/models/user_entity.dart';

abstract class ShopIMvpView implements IMvpView {

  void setUser(UserEntity? user);
  
  bool get isAccessibilityTest;
}
