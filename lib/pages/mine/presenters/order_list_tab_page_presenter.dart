import 'package:flutter/material.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:sp_util/sp_util.dart';

import '../../../config/constant.dart';
import '../../../models/borrow_list_entity.dart';
import '../iviews/order_list_i_mvp_view.dart';
class OrderListTabPagePresenter extends BasePagePresenter<OrderListIMvpView> {
  OrderListTabPagePresenter(this.tabIndex);

  final int tabIndex;

  @override
  void initState() {
    print('borrow_id::::::::::::::');
    print(tabIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Provider.of<ProductProvider>(view.getContext(), listen:false).bProductEntity.id!;
      index(true, tabIndex, true);
    });
  }

  Future index(bool isShowDialog, int tabIndex, [bool refresh = false]) {
    // int pageCurrent = Provider.of<OrderListPageProvider>(view.getContext(), listen: false).tabPageCurrentList[tabIndex];
    int pageCurrent = view.provider.tabPageCurrentList[tabIndex];
    if (refresh) {
      pageCurrent = 1;
    }
    Map<String, dynamic>? params = {'status': tabIndex, 'page': pageCurrent};
    return requestNetwork<BorrowListEntity>(Method.get, url: HttpApi.dBorrowsIndex, queryParameters: params, isShow: isShowDialog, onSuccess: (data) {
      if (data != null) {
        if (data.data!.isNotEmpty) {
          view.provider.setIndex(tabIndex);
          SpUtil.putStringList(Constant.borrowSortCount, [
            data.other!.all!.toString(),
            data.other!.review!.toString(),
            data.other!.rejected!.toString(),
            data.other!.disbursing!.toString(),
            data.other!.outstanding!.toString(),
            data.other!.overdue!.toString(),
            data.other!.closed!.toString(),
            data.other!.cleared!.toString(),
          ]);
          view.provider.setGoodsCount([
            data.other!.all!,
            data.other!.review!,
            data.other!.rejected!,
            data.other!.disbursing!,
            data.other!.outstanding!,
            data.other!.overdue!,
            data.other!.closed!,
            data.other!.cleared!,
          ]);
          if (refresh) {
            view.provider.setTabPageData([]);
            view.provider.setTabPageData(data.data!);
            view.provider.setTabPageCurrent(2);
          } else {
            view.provider.setTabPageData(data.data!);
            view.provider.setTabPageCurrent(data.currentPage! + 1);
          }
          view.provider.setHasMorePages(data.hasMorePages!);
        }
      }
    }, onError: (_, __) {
      /// 加载失败
      print(123);
    });
  }
}
