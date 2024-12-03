import '../../../generated/d_borrow_index_entity.dart';
import '../../../mvp/mvps.dart';

abstract class OrderIMvpView implements IMvpView {
  void goRepay();

  void index(List<DBorrowIndexData> data);
}
