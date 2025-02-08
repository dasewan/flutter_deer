import 'package:flutter/material.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:sp_util/sp_util.dart';

import '../../../config/constant.dart';
import '../../../models/borrow_list_entity.dart';
import '../../../models/repay_log_entity.dart';
import '../iviews/amount_record_list_i_mvp_view.dart';
import '../iviews/order_list_i_mvp_view.dart';
class AmountRecordListPagePresenter extends BasePagePresenter<AmountRecordListIMvpView> {
  AmountRecordListPagePresenter();


  @override
  void initState() {
    print('borrow_id::::::::::::::');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Provider.of<ProductProvider>(view.getContext(), listen:false).bProductEntity.id!;
      index(true, true);
    });
  }

  Future index(bool isShowDialog, [bool refresh = false]) {
    // int pageCurrent = Provider.of<OrderListPageProvider>(view.getContext(), listen: false).tabPageCurrentList[tabIndex];
    int pageCurrent = 1;
    if (refresh) {
      pageCurrent = 1;
    }
    Map<String, dynamic>? params = {'status': 1, 'page': pageCurrent};
    return requestNetwork<RepayLogEntity>(Method.get, url: HttpApi.repayLog, queryParameters: params, isShow: isShowDialog, onSuccess: (reponse) {
      if (reponse != null) {
        final List<RepayLogData> _transactions = reponse.data!;
        view.setStateData(_transactions);
      }
      // 模拟真实数据

    }, onError: (_, __) {
      /// 加载失败
      print(123);
    });
  }
}
