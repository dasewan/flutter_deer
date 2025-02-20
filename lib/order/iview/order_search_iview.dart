import 'package:myapp8/mvp/mvps.dart';
import 'package:myapp8/order/models/search_entity.dart';
import 'package:myapp8/order/provider/base_list_provider.dart';

abstract class OrderSearchIMvpView implements IMvpView {

  BaseListProvider<SearchItems> get provider;
}
