import 'package:myapp9/mvp/mvps.dart';
import 'package:myapp9/providers/repay_provider.dart';

abstract class RepayIMvpView implements IMvpView {
  RepayProvider get provider;

  void setInitial(List<bool> initialSelected, int initialSelectedCount, int initialSelectedAmount, List<int> initialSelectedIds, String sn);

  Future<bool> requestOpsPermission();
}
