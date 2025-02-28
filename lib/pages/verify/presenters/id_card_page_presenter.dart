import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/verify_item_store_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/pages/verify/iviews/id_card_i_mvp_view.dart';
import 'package:myapp9/providers/verify_provider.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../../../config/index_action_constant.dart';
import '../../../providers/user_provider.dart';
import '../../../util/device_utils.dart';
import '../../../util/helper.dart';

class IdCardPagePresenter extends BasePagePresenter<IdCardIMvpView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  void midnumbers(Map<String, String> formmap, isShowDialog) {
    // Map<String, String> formmapTmp = Map.fromIterable(formmap.keys.where((k) => true), key: (k) => k, value: (v) => v.text);
    // Map<String, String> formmapTmp = {for (var e in formmap.keys) e: formmap[e]!.text};
    if (formmap['m_idnumber'] == null || formmap['m_idnumber']!.isEmpty) {
      formmap['m_idnumber'] = SpUtil.getString(Constant.ocrIdResult, defValue: '')!;
    }
    if (formmap['q_name1'] == null || formmap['q_name1']!.isEmpty) {
      formmap['q_name1'] = SpUtil.getString(Constant.ocrNameResult, defValue: '')!;
    }
    formmap['is_web'] = Device.isWeb ? '1' : '0';
    FormData formData = FormData.fromMap(formmap);
    requestNetwork<VerifyItemStoreEntity>(Method.post, url: HttpApi.mIdnumbersStore, params: formData, isShow: isShowDialog as bool, onSuccess: (data) {
      if (data != null) {
        if (data.data!.next == '') {
          view.onCreateRefuse(data.message!);
          return;
        } else {
          if (data.data!.next == Constant.liveness || data.data!.next == SignRouter.sign) {
            view.getContext().read<UserProvider>().setIndexAction(IndexActionConst.sign.actionNo);
          }
          Helper.handleNextVerifyItem(view: view, next: data.data!.next);
          view.getContext().read<VerifyProvider>().setJIdnumberVerifyStatus(Constant.success);
          if(Device.isWeb){
            Helper.handleNextVerifyItem(view: view, next: data.data!.next);
            view.getContext().read<VerifyProvider>().setNContactVerifyStatus(Constant.success);
          }
          view.onCreateSuccess(data.data!.next!);
            }
          }
        }, onError: (_, __) {
          /// 加载失败
        });
  }


  /// 上传图片实现
  Future<String> uploadImg2(File image, File image2) async {
    String imgPath = '';
    try {
      final String path = image.path;
      final String name = path.substring(path.lastIndexOf('/') + 1);
      final String path2 = image2.path;
      final String name2 = path.substring(path2.lastIndexOf('/') + 1);
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'uploadIcon': await MultipartFile.fromFile(path, filename: name),
        'uploadIcon2': await MultipartFile.fromFile(path2, filename: name2),
      });
      await requestNetwork<String>(Method.post, url: HttpApi.upload, params: formData, onSuccess: (data) {
        imgPath = data ?? '';
      });
    } catch (e) {
      view.showToast('图片上传失败！');
    }
    return imgPath;
  }
}
