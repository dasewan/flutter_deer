
import 'package:flutter/material.dart';

import 'i_lifecycle.dart';

abstract class IMvpView {

  BuildContext getContext();
  /// 显示Progress
  void showProgress();

  /// 关闭Progress
  void closeProgress();

  /// 展示Toast
  void showToast(String string);

  void showCupertinoDialogSub({required String title, required String content});
  Future<bool> hasPermission(String type);
  Future<bool> serviceIsOn(String type);
  Future<bool> requestPermission(String type);
}

abstract class IPresenter extends ILifecycle {}
