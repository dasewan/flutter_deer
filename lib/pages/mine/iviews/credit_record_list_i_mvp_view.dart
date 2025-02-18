import 'package:myapp9/mvp/mvps.dart';

import '../../../models/credit_history_entity.dart';
import '../../../models/repay_log_entity.dart';
import '../../../providers/order_list_page_provider.dart';

abstract class CreditRecordListIMvpView implements IMvpView {
  void setStateData(List<CreditHistoryData> data);
}
