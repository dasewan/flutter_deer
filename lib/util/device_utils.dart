import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get_ip_address/get_ip_address.dart';

import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';

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
    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.text);

      /// Get the IpAddress based on requestType.
      String ip = await ipAddress.getIpAddress() as String;
      dynamicInfo['ip'] = ip;
      Stopwatch stopwatch = Stopwatch()..start();
      // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest, timeLimit: const Duration(seconds: 15));
      dynamicInfo['latitude'] = '0';
      dynamicInfo['longitude'] = '0';
      dynamicInfo['altitude'] = '0';
      stopwatch.stop();
      print('代码执行时间1: ${stopwatch.elapsedMilliseconds} 毫秒');
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      dynamicInfo['ip'] = "0.0.0.0";
      print(exception.message);
    }catch (e) {
      dynamicInfo['latitude'] = "0";
      dynamicInfo['longitude'] = "0";
      dynamicInfo['altitude'] = "0";
      // 没有指定的类型，处理所有异常
      print('Something really unknown: $e');
    }

    final connectivityResult = await (Connectivity().checkConnectivity());
    String connectivityType = connectivityResult.toString();
    dynamicInfo['connectivityType'] = connectivityType;
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      final NetworkInfo _networkInfo = NetworkInfo();

      try {
        try {
          if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
            // Request permissions as recommended by the plugin documentation:
            // https://github.com/fluttercommunity/plus_plugins/tree/main/packages/network_info_plus/network_info_plus
            if (await Permission.locationWhenInUse.request().isGranted) {
              wifiName = await _networkInfo.getWifiName();
            } else {
              wifiName = 'Unauthorized to get Wifi Name';
            }
          } else {
            wifiName = await _networkInfo.getWifiName();
          }
        } on PlatformException catch (e) {
          wifiName = 'Failed to get Wifi Name';
        }

        try {
          if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
            // Request permissions as recommended by the plugin documentation:
            // https://github.com/fluttercommunity/plus_plugins/tree/main/packages/network_info_plus/network_info_plus
            if (await Permission.locationWhenInUse.request().isGranted) {
              wifiBSSID = await _networkInfo.getWifiBSSID();
            } else {
              wifiBSSID = 'Unauthorized to get Wifi BSSID';
            }
          } else {
            wifiName = await _networkInfo.getWifiName();
          }
        } on PlatformException catch (e) {
          wifiBSSID = 'Failed to get Wifi BSSID';
        }

        try {
          wifiIPv4 = await _networkInfo.getWifiIP();
        } on PlatformException catch (e) {
          wifiIPv4 = 'Failed to get Wifi IPv4';
        }

        try {
          wifiIPv6 = await _networkInfo.getWifiIPv6();
        } on PlatformException catch (e) {
          wifiIPv6 = 'Failed to get Wifi IPv6';
        }

        try {
          wifiSubmask = await _networkInfo.getWifiSubmask();
        } on PlatformException catch (e) {
          wifiSubmask = 'Failed to get Wifi submask address';
        }

        try {
          wifiBroadcast = await _networkInfo.getWifiBroadcast();
        } on PlatformException catch (e) {
          wifiBroadcast = 'Failed to get Wifi broadcast';
        }

        try {
          wifiGatewayIP = await _networkInfo.getWifiGatewayIP();
        } on PlatformException catch (e) {
          wifiGatewayIP = 'Failed to get Wifi gateway address';
        }
        dynamicInfo['address'] = wifiIPv4;
        dynamicInfo['macAddress'] = wifiName;
        dynamicInfo['connectionType'] =  'unknown';
        dynamicInfo['ssid'] = wifiBSSID;
        dynamicInfo['e_node'] = node;
        dynamicInfo['c_device_id'] = SpUtil.getInt(Constant.deviceId)!.toString();
        /*Set<ActiveHost> activeHost = {};

        final String subnet = address.substring(0, address.lastIndexOf('.'));
        Stopwatch stopwatch2 = Stopwatch()..start();
        final stream = HostScanner.getAllPingableDevices(
          subnet,
          // firstHostId: 1,
          // lastHostId: 254,
          progressCallback: (progress) {
            print('Progress for host discovery : $progress');
          },
        );
        stream.listen(
              (ActiveHost host) async {
            activeHost.add(host);
          },
          onDone: () {
            dynamicInfo['hostCount'] = activeHost.length.toString();
            print(dynamicInfo);
            stopwatch2.stop();
            print('代码3执行时间: ${stopwatch2.elapsedMilliseconds} 毫秒');

            dynamicInfo['e_node'] = node;
            dynamicInfo['c_device_id'] = SpUtil.getInt(Constant.deviceId)!.toString();
            FormData formData = FormData.fromMap(dynamicInfo);

            DioUtils.instance.requestNetwork<dynamic>(
              Method.post,
              HttpApi.hDDynamicDevices,
              params: formData,
              onSuccess: (data) {
                print("++++++++++++++++++++++++++++++++++++");
              },
              onError: (code, msg) {},
            );
          },
        ); */ // Don't forget to cancel the stream when not in use.
      } on PlatformException {
        print("PlatformExceptionPlatformExceptionPlatformExceptionPlatformException");
      }
    }
    print("123");

    return dynamicInfo;
  }
}
