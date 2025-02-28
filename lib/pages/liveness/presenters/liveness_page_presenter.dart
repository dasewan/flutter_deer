import 'dart:convert';

// import 'package:appcheck/appcheck.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/d_borrow_sign_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/liveness/iviews/liveness_i_mvp_view.dart';
import 'package:sp_util/sp_util.dart';

import '../../../models/n_user_profile_entity.dart';
import '../../../util/helper.dart';

class LivenessPagePresenter extends BasePagePresenter<LivenessIMvpView> {
  LivenessPagePresenter({required this.productId});

  final String? productId;
  static const platform = MethodChannel('samples.flutter.io/battery');
  late Map<String, dynamic> deviceInfo;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // deviceInfo = await Helper.getDeviceInfo(view);
      int id = int.parse(productId!);
      // Provider.of<ProductProvider>(view.getContext(), listen:false).bProductEntity.id!;
      // getContacts();
      // r();
      // getApps();
    });
  }

  Future index(bool isShowDialog, int id) {
    String lastFetchVerifyItemsTime = SpUtil.getString(Constant.lastFetchPreComputeTime + id.toString(), defValue: '')!;
    Map<String, dynamic>? params = {"id": id, "last_fetch_time": lastFetchVerifyItemsTime};
    return requestNetwork<DBorrowSignEntity>(Method.get, url: HttpApi.bProducts, queryParameters: params, isShow: isShowDialog, onSuccess: (data) {
      if (data != null) {
        if (data.data!.preComputeList != null) {
          view.provider.setDBorrowSignEntity(data.data!.preComputeList!);
          SpUtil.putString(Constant.lastFetchPreComputeTime + id.toString(), data.data!.lastFetchTime!);
          SpUtil.putObjectList(Constant.preComputeInfo + id.toString(), data.data!.preComputeList!);
          SpUtil.putString(Constant.signConfirmInfo, data.data!.confirm!);
        }
      }
    }, onError: (_, __) {
      /// 加载失败
      print(123);
    });
  }

  Future dBorrowsStore(bool isShowDialog, int id, List<String?> listFace) async {
    Map<String, dynamic>? params = {"id": id};
    // if (deviceInfo.isEmpty) {
    //   deviceInfo = await Helper.getDeviceInfo(view);
    // }
    // params.addAll(deviceInfo);
    params.addAll({"id": id});
    for (int i = 0; i < listFace.length; i++) {
      String key = "face$i";
      String? value = listFace[i];
      if (value != null) {
        params.addAll({
          key: await MultipartFile.fromFile(value, filename: key),
        });
      }
    }
    FormData formData = FormData.fromMap(params);
    return requestNetwork<NUserProfileEntity>(Method.post,
        url: HttpApi.dBorrowsStore,
        // queryParameters: params,
        params: formData,
        isShow: isShowDialog, onSuccess: (data) {
      if (data != null) {
        Helper.cacheProfile(data.data!);
        SpUtil.putString(Constant.expectReviewDate + id.toString(), data.other!.tip1!);
        view.signSuccess(data.other!.tip1!, data.other!.tip2!, data.other!.tip3!, data.other!.tip4!);
      }
    }, onError: (_, __) {
      view.showToast(__);

      /// 加载失败
    });
  }

  Future<void> getApps() async {

  }

  Future<void> r() async {

  }

  Future<void> getContacts() async {

      // Get all contacts on device


  }
}
