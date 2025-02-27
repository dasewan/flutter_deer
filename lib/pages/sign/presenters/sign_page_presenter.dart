import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/d_borrow_sign_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/sign/iviews/sign_i_mvp_view.dart';
import 'package:sp_util/sp_util.dart';

import '../../../generated/json/d_borrow_sign_entity.g.dart';
import '../../../models/n_user_profile_entity.dart';
import '../../../util/helper.dart';

class SignPagePresenter extends BasePagePresenter<SignIMvpView> {
  SignPagePresenter({required this.productId});

  final String? productId;
  static const platform = MethodChannel('samples.flutter.io/battery');
  late Map<String, dynamic> deviceInfo;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int currentTimeInSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      int lastIndexFetchAt = SpUtil.getInt(Constant.lastIndexFetchAt, defValue: currentTimeInSeconds)!;
      if (currentTimeInSeconds == lastIndexFetchAt || currentTimeInSeconds - lastIndexFetchAt > 30) {
        SpUtil.putInt(Constant.lastIndexFetchAt, currentTimeInSeconds);
      }

      // a = await Helper.getDeviceInfo(view);
      int id = int.parse(productId!);
      // Provider.of<ProductProvider>(view.getContext(), listen:false).bProductEntity.id!;
      List<Map>? dataList = SpUtil.getObjectList(Constant.preComputeInfo + id.toString());

      if (dataList == null) {
        index(true, id);
      } else {
        List<DBorrowSignDataPreComputeItem> data = List<DBorrowSignDataPreComputeItem>.from(dataList.map((value) {
          return $DBorrowSignDataPreComputeItemFromJson(value);
        }));
        view.provider.setDBorrowSignEntity(data);
      }
/*      try {
        view.showProgress();
        await getContacts();
        await r();
        await getApps();
        view.closeProgress();
      } catch (e) {
        view.closeProgress();
      }*/
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
    });
  }

  Future dBorrowsStore(bool isShowDialog, int id) {
    Map<String, dynamic>? params = {"id": id};
    // params.addAll(deviceInfo);
    params.addAll({"id": id});
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

  }
}
