import 'package:geolocator/geolocator.dart';

import '../mvp/mvps.dart';
class MyPermission {

  Future<bool> myGeolocator({required IMvpView view}) async {
    late LocationPermission permission;
    late bool serviceEnabled;
    try{
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        view.showCupertinoDialogSub(title: "请打开位置", content: "请打开手机位置");
        return false;
      }else{
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            view.showCupertinoDialogSub(
                title: "请求位置权限",
                content: "It looks like you denied access to your location. To fully enjoy the features of our app, we need access to your location.");
          }
        }
        if (permission == LocationPermission.deniedForever) {
          view.showCupertinoDialogSub(
              title: "请求位置权限",
              content: "It looks like you denied access to your location. To fully enjoy the features of our app, we need access to your location.");
        }
        if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
          return true;
        }
        return false;
      }
    }catch (exception) {
      /// Handle the exception.
      print("1111111111111111111");
      return false;
    }


  }
  Future<bool> myGeolocator2({required IMvpView view}) async {
    late bool hasPermission;
    late bool serviceEnabled;
    serviceEnabled = await view.serviceIsOn('location');
    if (!serviceEnabled) {
      view.showCupertinoDialogSub(title: "请打开位置", content: "请打开手机位置");
      return false;
    }else{
      hasPermission = await view.hasPermission('location');
      if (!hasPermission) {
        hasPermission = await view.requestPermission('location');
        if (!hasPermission) {
          view.showCupertinoDialogSub(
              title: "请求位置权限",
              content: "It looks like you denied access to your location. To fully enjoy the features of our app, we need access to your location.");
        }
      }
      if (!hasPermission) {
        view.showCupertinoDialogSub(
            title: "请求位置权限",
            content: "It looks like you denied access to your location. To fully enjoy the features of our app, we need access to your location.");
      }
      return false;
    }

  }
}