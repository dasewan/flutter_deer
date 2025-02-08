import 'package:myapp9/mvp/mvps.dart';

import '../../../models/repay_log_entity.dart';
import '../../../providers/order_list_page_provider.dart';

abstract class AmountRecordListIMvpView implements IMvpView {
  void setStateData(List<RepayLogData> data);
}
