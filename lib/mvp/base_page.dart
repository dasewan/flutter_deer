import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/mvp/base_presenter.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/log_utils.dart';
import 'package:myapp9/util/toast_utils.dart';
import 'package:myapp9/widgets/progress_dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'mvps.dart';

import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';

mixin BasePageMixin<T extends StatefulWidget, P extends BasePresenter> on State<T> implements IMvpView {

  P? presenter;

  P createPresenter();
  
  @override
  BuildContext getContext() {
    return context;
  }
  
  @override
  void closeProgress() {
    if (mounted && _isShowDialog) {
      _isShowDialog = false;
      NavigatorUtils.goBack(context);
    }
  }

  bool _isShowDialog = false;

  @override
  void showProgress() {
    /// 避免重复弹出
    if (mounted && !_isShowDialog) {
      _isShowDialog = true;
      try {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          barrierColor: const Color(0x00FFFFFF), // 默认dialog背景色为半透明黑色，这里修改为透明（1.20添加属性）
          builder:(_) {
            return WillPopScope(
              onWillPop: () async {
                // 拦截到返回键，证明dialog被手动关闭
                _isShowDialog = false;
                return Future.value(true);
              },
              child: buildProgress(),
            );
          },
        );
      } catch(e) {
        /// 异常原因主要是页面没有build完成就调用Progress。
        debugPrint(e.toString());
      }
    }
  }

  @override
  void showToast(String string) {
    Toast.show(string);
  }
  
  /// 可自定义Progress
  Widget buildProgress() => const ProgressDialog(hintText: 'Loading...');





  // my-start

  @override
  void showCupertinoDialogSub({required String title, required String content}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content, textAlign: TextAlign.left),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('cancle'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: const Text('confirm'),
                onPressed: () {
                  Navigator.pop(context);
                  // 打开手机上该app权限的页面
                  openAppSettings();
                },
              ),
            ],
          );
        });
  }
  @override
  Future<bool> hasPermission(String type) async {
    return true;
  }
  @override
  Future<bool> requestPermission(String type) async {

    return true;
  }
  @override
  Future<bool> serviceIsOn(String type) async {
    const platform = MethodChannel('samples.flutter.io/battery');
    Map<String, dynamic> arguments = <String, dynamic>{
      'type': type,
    };
    bool isOn = await platform.invokeMethod('serviceIsOn', arguments) as bool;
    return isOn;
  }
  // my-end










  @override
  void didChangeDependencies() {
    presenter?.didChangeDependencies();
    Log.d('$T ==> didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    presenter?.dispose();
    Log.d('$T ==> dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    presenter?.deactivate();
    Log.d('$T ==> deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    presenter?.didUpdateWidgets<T>(oldWidget);
    Log.d('$T ==> didUpdateWidgets');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    Log.d('$T ==> initState');
    presenter = createPresenter();
    presenter?.view = this;
    presenter?.initState();
    super.initState();
  }
  
}
