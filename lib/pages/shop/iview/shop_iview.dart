import 'package:myapp9/providers/center_provider.dart';

import '../../../mvp/mvps.dart';

abstract class ShopIMvpView implements IMvpView {
  CenterProvider get provider;
}
