import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/image_utils.dart';
import 'package:myapp9/util/theme_utils.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

import '../../../providers/product_new_provider.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({Key? key, this.child, required this.onPressed}) : super(key: key);

  final Function(int) onPressed;
  final Widget? child;

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      precacheImage(ImageUtils.getAssetImage('confirm_head', format: ImageFormat.png), context);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String info = SpUtil.getString(Constant.signConfirmInfo)!;
    return WillPopScope(
      onWillPop: () async {
        /// 使用false禁止返回键返回，达到强制升级目的
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 280.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                    image: DecorationImage(
                      image: ImageUtils.getAssetImage('confirm_head', format: ImageFormat.png),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 280.0,
                  decoration: BoxDecoration(
                      color: context.dialogBackgroundColor,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0))),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      widget.child != null ? widget.child! : Text(info),
                      Gaps.vGap15,
                      _buildButton(context),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildButton(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 110.0,
          height: 36.0,
          child: MyButton(
            text: 'Cancel',
            fontSize: Dimens.font_sp16,
            textColor: primaryColor,
            disabledTextColor: Colors.white,
            disabledBackgroundColor: Colours.text_gray_c,
            radius: 18.0,
            side: BorderSide(
              color: primaryColor,
              width: 0.8,
            ),
            backgroundColor: Colors.transparent,
            onPressed: () {
              NavigatorUtils.goBack(context);
            },
          ),
        ),
        SizedBox(
          width: 110.0,
          height: 36.0,
          child: MyButton(
            text: 'Confirm',
            fontSize: Dimens.font_sp16,
            onPressed: () {
              if (defaultTargetPlatform == TargetPlatform.iOS) {
                NavigatorUtils.goBack(context);
              } else {
                setState(() {});
                _doBorrow();
              }
            },
            textColor: Colors.white,
            backgroundColor: primaryColor,
            disabledTextColor: Colors.white,
            disabledBackgroundColor: Colours.text_gray_c,
            radius: 18.0,
          ),
        )
      ],
    );
  }

  ///下载apk
  Future<void> _doBorrow() async {
    int id = Provider.of<ProductNewProvider>(context, listen: false).bProductEntity.id!;
    widget.onPressed(id);
    // Toast.show(id.toString());
  }
}
