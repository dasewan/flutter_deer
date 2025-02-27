import 'dart:convert';

// import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/verify_item_store_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/pages/verify/iviews/contact_i_mvp_view.dart';
import 'package:myapp9/providers/verify_provider.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../../../config/index_action_constant.dart';
import '../../../providers/user_provider.dart';
import '../../../util/helper.dart';

class ContactPagePresenter extends BasePagePresenter<ContactIMvpView> {
  static const platform = MethodChannel('samples.flutter.io/battery');

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getContacts();
      // r();
    });
  }

  void midnumbers(Map<String, String> formmap, isShowDialog) {
    // Map<String, String> formmapTmp = Map.fromIterable(formmap.keys.where((k) => true), key: (k) => k, value: (v) => v.text);
    // Map<String, String> formmapTmp = {for (var e in formmap.keys) e: formmap[e]!.text};
    FormData formData = FormData.fromMap(formmap);
    requestNetwork<VerifyItemStoreEntity>(Method.post, url: HttpApi.oContactStore, params: formData, isShow: isShowDialog as bool, onSuccess: (data) {
      if (data != null) {
        //  Provider.of<ThemeProvider>(context, listen: false).setTheme(themeMode);
        /// 与上方等价，provider 4.1.0添加的拓展方法
        if (data.data!.next == Constant.liveness || data.data!.next == SignRouter.sign) {
          view.getContext().read<UserProvider>().setIndexAction(IndexActionConst.sign.actionNo);
        }
        Helper.handleNextVerifyItem(view: view, next: data.data!.next);
        view.getContext().read<VerifyProvider>().setNContactVerifyStatus(Constant.success);
        view.onCreateSuccess(data.data!.next!);
      }
    }, onError: (_, __) {
      /// 加载失败
    });
  }

  Future<void> r() async {

  }

  Future<void> getContacts() async {

  }
}
