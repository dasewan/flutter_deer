import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/verify_item_store_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/providers/verify_provider.dart';
import 'package:provider/provider.dart';

import '../../../config/index_action_constant.dart';
import '../../../providers/user_provider.dart';
import '../../../util/helper.dart';
import '../iviews/loan_bank_i_mvp_view.dart';

class LoanBankPagePresenter extends BasePagePresenter<LoanBankIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  void store(Map<String, String> formmap, isShowDialog) {
    // Map<String, String> formmapTmp = Map.fromIterable(formmap.keys.where((k) => true), key: (k) => k, value: (v) => v.text);
    // Map<String, String> formmapTmp = {for (var e in formmap.keys) e: formmap[e]!.text};
    FormData formData = FormData.fromMap(formmap);
    requestNetwork<VerifyItemStoreEntity>(Method.post, url: HttpApi.aOLoanBankStore, params: formData, isShow: isShowDialog as bool, onSuccess: (data) {
      if (data != null) {
        if (data.data!.next == '') {
          view.onCreateRefuse(data.message!);
          return;
        } else {
          if (data.data!.next == Constant.liveness || data.data!.next == SignRouter.sign) {
            view.getContext().read<UserProvider>().setIndexAction(IndexActionConst.sign.actionNo);
          }
          Helper.handleNextVerifyItem(view: view, next: data.data!.next);
          view.getContext().read<VerifyProvider>().setRLoanBankStatus(Constant.success);
          view.onCreateSuccess(data.data!.next!, data.data!.next! == '/home');
        }
      }
    }, onError: (_, __) {
      /// 加载失败
    });
  }

}
