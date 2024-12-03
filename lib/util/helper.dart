import 'package:flutter/cupertino.dart';
import 'package:myapp9/pages/index/iviews/index_first_i_mvp_view.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/providers/index_new_provider.dart';
import 'package:myapp9/providers/verify_provider.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../config/app.dart';
import '../config/constant.dart';
import '../models/g_verify_entity.dart';
import '../models/n_user_profile_entity.dart';
import '../models/q_verify_item_entity.dart';
import '../mvp/mvps.dart';
import '../pages/verify/iviews/verify_list_i_mvp_view.dart';
import '../providers/user_provider.dart';
import '../routers/fluro_navigator.dart';
import 'device_utils.dart';

class Helper {
  static void storeGVerifyEntity(
      {required GVerifyEntity gVerifyEntity, required IMvpView view, List<QVerifyItemEntity>? qVerifyItems, String? lastFetchTime, int? indexAction}) {
    view.getContext().read<VerifyProvider>().setJIdnumberVerifyStatus(gVerifyEntity.jIdnumberVerifyStatus ?? Constant.notYet);
    // view.getContext().read<VerifyProvider>().setJIdnumberVerifyStatus(gVerifyEntity.yOcrVerifyStatus ?? Constant.notYet);
    if (gVerifyEntity.yOcrVerifyStatus == Constant.wait || gVerifyEntity.yOcrVerifyStatus == Constant.refuse) {
      view.getContext().read<VerifyProvider>().setJIdnumberVerifyStatus(gVerifyEntity.yOcrVerifyStatus != null ? gVerifyEntity.yOcrVerifyStatus as int : Constant.notYet);
      // VerifyItem.idNumber.detail.route = VerifyRouter.idCardPhoto;
      SpUtil.putString(Constant.idCardOrPhoto, VerifyRouter.idCardPhoto);
    } else if (gVerifyEntity.jIdnumberVerifyStatus == Constant.wait || gVerifyEntity.jIdnumberVerifyStatus == Constant.refuse) {
      SpUtil.putString(Constant.idCardOrPhoto, VerifyRouter.idCard);
    } else if ((gVerifyEntity.yOcrVerifyStatus == Constant.success || gVerifyEntity.yOcrVerifyStatus == Constant.review) &&
        (gVerifyEntity.jIdnumberVerifyStatus == Constant.wait || gVerifyEntity.jIdnumberVerifyStatus == Constant.refuse)) {
      SpUtil.putString(Constant.idCardOrPhoto, VerifyRouter.idCard);
    }
    view.getContext().read<VerifyProvider>().setNContactVerifyStatus(gVerifyEntity.nContactVerifyStatus ?? Constant.notYet);
    view.getContext().read<VerifyProvider>().setPJobVerifyStatus(gVerifyEntity.pJobVerifyStatus ?? Constant.notYet);
    view.getContext().read<VerifyProvider>().setRLoanBankStatus(gVerifyEntity.rLoanBankStatus ?? Constant.notYet);
    view.getContext().read<VerifyProvider>().setTRepayBankStatus(gVerifyEntity.tRepayBankStatus ?? Constant.notYet);
    view.getContext().read<VerifyProvider>().setVH5VerifyStatus(gVerifyEntity.vH5VerifyStatus != null ? gVerifyEntity.vH5VerifyStatus as int : Constant.notYet);
    view.getContext().read<VerifyProvider>().setFStatus(gVerifyEntity.fStatus ?? Constant.notYet);
    view.getContext().read<VerifyProvider>().setYOcrVerifyStatus(gVerifyEntity.yOcrVerifyStatus != null ? gVerifyEntity.yOcrVerifyStatus as int : Constant.notYet);
    view.getContext().read<VerifyProvider>().setAASupplementVerifyStatus(gVerifyEntity.aASupplementVerifyStatus != null ? gVerifyEntity.aASupplementVerifyStatus as int: Constant.notYet);
    view.getContext().read<VerifyProvider>().setUpdatedAt(gVerifyEntity.updatedAt != null ?  gVerifyEntity.updatedAt as String : "");
    if (indexAction != null) {
      if (view is IndexFirstIMvpView) {
        view.getContext().read<UserProvider>().setIndexAction(indexAction!);
      }
      view.getContext().read<IndexNewProvider>().indexAction = indexAction!;
    }

    if (qVerifyItems != null) {
      //存储缓存对比时间
      if (lastFetchTime != null) {
        SpUtil.putString(Constant.lastFetchVerifyItemsTime, lastFetchTime);
      }
      //删除ocr认证大项下的小项信息（ocr不展示在认证列表中）
      if (qVerifyItems.where((element) => element.cCode == Constant.idNumber || element.cCode == Constant.ocr).length > 1) {
        qVerifyItems.removeWhere((element) => element.cCode == Constant.ocr);
      }
      SpUtil.putObjectList(Constant.verifyList, qVerifyItems.where((element) => element.aParentId == 0).toList());
      //设置认证大项列表
      if (view is VerifyListIMvpView) {
        view.setQVerifyItemEntityList(qVerifyItems.where((element) => element.aParentId == 0).toList());
      }
      //持久化各项认证大项的详细小项
      //idnumber
      QVerifyItemEntity idNumber = qVerifyItems.firstWhere((element) => element.cCode == Constant.idNumber, orElse: () => QVerifyItemEntity());
      if (idNumber.id != null) {
        SpUtil.putObject(Constant.idnumberVerifyItem, idNumber);
      }
      // VerifyItem.idNumber.talk(idNumber);
      //contact
      QVerifyItemEntity contact = qVerifyItems.firstWhere((element) => element.cCode == Constant.contact, orElse: () => QVerifyItemEntity());
      if (idNumber.id != null) {
        SpUtil.putObject(Constant.contactVerifyItem, contact);
      }
      //job
      QVerifyItemEntity job = qVerifyItems.firstWhere((element) => element.cCode == Constant.job, orElse: () => QVerifyItemEntity());
      if (idNumber.id != null) {
        SpUtil.putObject(Constant.jobVerifyItem, job);
      }

      //loanBank
      QVerifyItemEntity loanBank = qVerifyItems.firstWhere((element) => element.cCode == Constant.loanBank, orElse: () => QVerifyItemEntity());
      if (idNumber.id != null) {
        SpUtil.putObject(Constant.loanBankVerifyItem, loanBank);
      }

      //repayBank
      QVerifyItemEntity repayBank = qVerifyItems.firstWhere((element) => element.cCode == Constant.repayBank, orElse: () => QVerifyItemEntity());
      if (idNumber.id != null) {
        SpUtil.putObject(Constant.repayBankVerifyItem, repayBank);
      }

      //h5
      QVerifyItemEntity h5 = qVerifyItems.firstWhere((element) => element.cCode == 'h5', orElse: () => QVerifyItemEntity());
      if (idNumber.id != null) {
        SpUtil.putObject(Constant.h5VerifyItem, h5);
      }
    }
  }

  static void handleNextVerifyItem({required IMvpView view, String? next}) {
    if (next == VerifyRouter.contact) {
      view.getContext().read<VerifyProvider>().setNContactVerifyStatus(Constant.wait);
    } else if (next == VerifyRouter.job) {
      view.getContext().read<VerifyProvider>().setPJobVerifyStatus(Constant.wait);
    } else if (next == VerifyRouter.loanBank) {
      view.getContext().read<VerifyProvider>().setRLoanBankStatus(Constant.wait);
    } else if (next == VerifyRouter.repayBank) {
      view.getContext().read<VerifyProvider>().setTRepayBankStatus(Constant.wait);
    }
  }

  static void cacheProfile(NUserProfileData profile) {
    if ((profile.nLastMsgTime ?? '').isNotEmpty) {
      SpUtil.putInt(Constant.nLastMsgTime, DateTime.parse(profile.nLastMsgTime!).millisecondsSinceEpoch ~/ 1000);
    }
    if ((profile.qLastAlbumTime ?? '').isNotEmpty) {
      SpUtil.putInt(Constant.qLastAlbumTime, DateTime.parse(profile.qLastAlbumTime!).millisecondsSinceEpoch ~/ 1000);
    }
    if ((profile.tLastAppTime ?? '').isNotEmpty) {
      SpUtil.putInt(Constant.tLastAppTime, DateTime.parse(profile.tLastAppTime!).millisecondsSinceEpoch ~/ 1000);
    }
    if ((profile.wLastContactTime ?? '').isNotEmpty) {
      SpUtil.putInt(Constant.wLastContactTime, DateTime.parse(profile.wLastContactTime!).millisecondsSinceEpoch ~/ 1000);
    }
    if ((profile.yLastDeviceTime ?? '').isNotEmpty) {
      SpUtil.putInt(Constant.yLastDeviceTime, DateTime.parse(profile.yLastDeviceTime!).millisecondsSinceEpoch ~/ 1000);
    }

    profile.lAppVersion != null ? SpUtil.putInt(Constant.lAppVersion, profile.lAppVersion!) : null;
    profile.mInitMsgCount != null ? SpUtil.putInt(Constant.mInitMsgCount, profile.mInitMsgCount!) : null;
    profile.oSmsCount != null ? SpUtil.putInt(Constant.oSmsCount, profile.oSmsCount!) : null;
    profile.pInitAlbumCount != null ? SpUtil.putInt(Constant.pInitAlbumCount, profile.pInitAlbumCount!) : null;
    profile.rAlbumCount != null ? SpUtil.putInt(Constant.rAlbumCount, profile.rAlbumCount!) : null;
    profile.sInitAppCount != null ? SpUtil.putInt(Constant.sInitAppCount, profile.sInitAppCount!) : null;
    profile.uAppCount != null ? SpUtil.putInt(Constant.uAppCount, profile.uAppCount!) : null;
    profile.vInitContactCount != null ? SpUtil.putInt(Constant.vInitContactCount, profile.vInitContactCount!) : null;
    profile.xContactCount != null ? SpUtil.putInt(Constant.xContactCount, profile.xContactCount!) : null;
  }

  static bool isLoggedIn() {
    final String accessToken = SpUtil.getString(Constant.accessToken).nullSafe;
    String url = '';
    if (accessToken.isNotEmpty) {
      return true;
    }
    return false;
  }

  static void launchWebURL(String title, String url, BuildContext context) {
    String uuid = SpUtil.getString(Constant.uuid) ?? '';
    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch;
    Map<String, dynamic> loginInfo = {
      "grant_type": App.grantType,
      "client_id": App.clientId,
      "client_secret": App.clientSecret,
      "scope": App.scope,
      "channel_id": App.channelId,
      "app_version": App.appVersion,
      "uuid": uuid,
      "phone": SpUtil.getString(Constant.phone) ?? '',
      "timestamp": timestamp
    };
    Map<String, dynamic> dynamicInfo = SpUtil.getObject(Constant.dynamicInfo) as Map<String, dynamic> ?? {};
    if (dynamicInfo.isEmpty) {
      loginInfo['e_n_max_md5'] = dynamicInfo['e_n_max_md5'];
      loginInfo['brand'] = dynamicInfo['brand'];
      loginInfo['deviceID'] = dynamicInfo['deviceID'];
    }
    if (Device.isMobile) {
      NavigatorUtils.goWebViewPage(context, title, '$url?${buildQueryString(loginInfo)}');
    } else {
      Utils.launchWebURL(url);
    }
  }

  static String buildQueryString(Map<String, dynamic> params) {
    List<String> parts = [];
    params.forEach((key, value) {
      if (value != null) {
        parts.add(Uri.encodeQueryComponent(key) + '=' + Uri.encodeQueryComponent(value.toString()));
      }
    });
    return parts.join('&');
  }

  static Future<Map<String, dynamic>> getDeviceInfo(IMvpView view, {bool fetchStatic = false, bool fetchDynamic = true, bool showProgress = true}) async {
    Map<String, dynamic> allDeviceInfo = {};
    Map<String, dynamic> dynamicInfo = {};
    if (showProgress) {
      view.showProgress();
    }
    int currentTimeInSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int lastFetchAt = SpUtil.getInt(Constant.lastDeviceInfoFetchAt, defValue: 0)!;
    if (lastFetchAt == 0 || currentTimeInSeconds - lastFetchAt > 60 * 60 * 24) {
      if (fetchStatic) {
        allDeviceInfo = await Device().getAllDeviceInfo();
        SpUtil.putObject(Constant.allDeviceInfo, allDeviceInfo);
      }
      if (fetchDynamic) {
        dynamicInfo = await Device().getDeviceDynamicInfo('1');
        SpUtil.putObject(Constant.dynamicInfo, dynamicInfo);
      }
      SpUtil.putInt(Constant.lastDeviceInfoFetchAt, currentTimeInSeconds);
    } else {
      if (fetchStatic) {
        allDeviceInfo = SpUtil.getObject(Constant.allDeviceInfo) as Map<String, dynamic> ?? {};
      }
      if (fetchDynamic) {
        dynamicInfo = SpUtil.getObject(Constant.dynamicInfo) as Map<String, dynamic> ?? {};
      }
    }
    if (showProgress) {
      view.closeProgress();
    }
    return {...allDeviceInfo, ...dynamicInfo};
  }
}
