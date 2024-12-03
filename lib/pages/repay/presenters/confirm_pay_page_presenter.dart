import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/repay/iviews/confirm_pay_i_mvp_view.dart';

import '../../../models/borrow_detail_entity.dart';

class ConfirmPayPagePresenter extends BasePagePresenter<ConfirmPayIMvpView> {
  ConfirmPayPagePresenter();

  static const platform = MethodChannel('samples.flutter.io/battery');
  late Map<String, dynamic> allDeviceInfo;
  late Map<String, dynamic> dynamicInfo;

  @override
  void initState() {
    print('borrow_id:');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // allDeviceInfo = await Device().getAllDeviceInfo();
      // dynamicInfo = await Device().getDeviceDynamicInfo('1');
    });
  }

  Future index(bool isShowDialog, int id) {
    Map<String, dynamic>? params = {};
    return requestNetwork<BorrowDetailEntity>(Method.get, url: '${HttpApi.dBorrowsShow}/1009', queryParameters: params, isShow: isShowDialog,
        onSuccess: (data) {
      if (data != null) {
        if (data.data!.borrow != null) {}
        if (data.data!.periods != null) {
          List<BorrowDetailDataPeriods> duePeriods = data.data!.periods!.where((element) => element.eStatus != 80).toList();
          late List<bool> initialSelected = List.generate(duePeriods.length, (_) => false);
          late int initialSelectedCount = 0;
          late int initialSelectedAmount = 0;

          for (var i = 0; i < duePeriods.length; i++) {
            if (duePeriods[i].lOverdueDays! > 0) {
              initialSelected[i] = true;
              initialSelectedCount++;
              initialSelectedAmount += duePeriods[i].fExpectRepayTotalAmount!;
            }
          }
        }
        if (data.data!.product != null) {}
        if (data.data!.loan != null) {}
        if (data.data!.tips != null) {}
      }
    }, onError: (_, __) {
      /// 加载失败
      print(123);
    });
  }
}
