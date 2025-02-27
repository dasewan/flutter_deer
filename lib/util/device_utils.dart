import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';

import '../config/constant.dart';


/// https://medium.com/gskinner-team/flutter-simplify-platform-screen-size-detection-4cb6fc4f7ed1
class Device {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWeb => kIsWeb;

  static bool get isWindows => !isWeb && Platform.isWindows;
  static bool get isLinux => !isWeb && Platform.isLinux;
  static bool get isMacOS => !isWeb && Platform.isMacOS;
  static bool get isAndroid => !isWeb && Platform.isAndroid;
  static bool get isFuchsia => !isWeb && Platform.isFuchsia;
  static bool get isIOS => !isWeb && Platform.isIOS;

  static late AndroidDeviceInfo _androidInfo;

  static Future<void> initDeviceInfo() async {
    if (isAndroid) {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      _androidInfo = await deviceInfo.androidInfo;
    }
  }

  /// 使用前记得初始化
  static int getAndroidSdkInt() {
    if (Constant.isDriverTest) {
      return -1;
    }
    if (isAndroid) {
      return _androidInfo.version.sdkInt;
    } else {
      return -1;
    }
  }

  static String md5SortedFormData(FormData formData) {
    // 将 FormData 转换为 List
    final fields = formData.fields.toList();

    // 按照键的字母顺序排序
    fields.sort((a, b) => a.key.compareTo(b.key));

    // 将键值对拼接为字符串
    final stringToHash = fields.map((e) => '${e.key}=${e.value}').join('&');

    // 计算 MD5 哈希值
    final hash = md5.convert(utf8.encode(stringToHash)).toString();

    return hash;
  }

  static Future<String?> getDeviceId() async {
    // return await PlatformDeviceId.getDeviceId;
    return '';
  }

  static Future<bool?> checkRoot() async {
    // return  await RootCheck.isRooted;
    return true;
  }
  Future<Map<String, dynamic>> getAllDeviceInfo() async {
    AndroidDeviceInfo _androidDeviceInfo = _androidInfo;

    _androidDeviceInfo.data.removeWhere((key, value) => value is! String);
    FormData formData2 = FormData.fromMap(_androidDeviceInfo.data);
    Map<String, String?> otherFormData = {};
    otherFormData['id2'] = _androidDeviceInfo.id;
    otherFormData['e_n_max_md5'] = Device.md5SortedFormData(formData2);
    String? deviceID = await Device.getDeviceId();
    otherFormData['deviceID'] = deviceID;
    bool? isRoot = await Device.checkRoot();
    otherFormData['isRoot'] = isRoot?.toString();
    _androidDeviceInfo.data.removeWhere((key, value) => key == 'id');
    _androidDeviceInfo.data.addAll(otherFormData);
    return _androidDeviceInfo.data;
  }


  Future<Map<String, String?>> getDeviceDynamicInfo(String node) async {
    String? wifiName,
        wifiBSSID,
        wifiIPv4,
        wifiIPv6,
        wifiGatewayIP,
        wifiBroadcast,
        wifiSubmask;
    Map<String, String?> dynamicInfo = {};


    return dynamicInfo;
  }
}
