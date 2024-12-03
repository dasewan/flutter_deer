import 'package:myapp9/mvp/mvps.dart';
import 'package:myapp9/providers/index_first_provider.dart';

abstract class IndexRepayIMvpView implements IMvpView {
  IndexFirstProvider get provider;

  void showPopupOverlay(int indexAction);
}
