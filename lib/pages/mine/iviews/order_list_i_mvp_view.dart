import 'package:myapp9/mvp/mvps.dart';

import '../../../providers/order_list_page_provider.dart';

abstract class OrderListIMvpView implements IMvpView {
  OrderListPageProvider get provider;
}
