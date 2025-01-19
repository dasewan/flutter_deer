import 'package:flutter/material.dart';
import 'package:myapp9/providers/product_provider.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/image_utils.dart';
import 'package:myapp9/util/theme_utils.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:provider/provider.dart';

import '../../../models/index_entity.dart';

class RepayDialog extends StatefulWidget {
  const RepayDialog({Key? key, required this.indexAction, required this.onPressed, required this.remind}) : super(key: key);
  final int indexAction;
  final Function(int) onPressed;
  final IndexDataRemind remind;

  @override
  _RepayDialogState createState() => _RepayDialogState();
}

class _RepayDialogState extends State<RepayDialog> {
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
    List<String> reminds = widget.remind.content!.split("|").toList();
    List<String> placeholders = widget.remind.date!.split("|").toList();

    List<InlineSpan> textSpans = [];

    for (int i = 0; i < reminds.length; i++) {
      textSpans.add(TextSpan(text: reminds[i]));

      if (i < placeholders.length) {
        textSpans.add(
          TextSpan(
            text: placeholders[i],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }
    }
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
                  width: 320.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                    image: DecorationImage(
                      image: ImageUtils.getAssetImage(widget.remind.type!, format: ImageFormat.png),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 320.0,
                  decoration: BoxDecoration(
                      color: context.dialogBackgroundColor,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0))),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Gaps.vGap5,
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: textSpans,
                        ),
                      ),
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
        widget.remind.url!.isNotEmpty
            ? SizedBox(
                width: 110.0,
          height: 36.0,
          child: MyButton(
                  text: widget.remind.title!,
                  fontSize: Dimens.font_sp16,
            onPressed: () {
                    NavigatorUtils.push(context, widget.remind.url!, replace: true);
                  },
            textColor: Colors.white,
            backgroundColor: primaryColor,
            disabledTextColor: Colors.white,
            disabledBackgroundColor: Colours.text_gray_c,
            radius: 18.0,
          ),
              )
            : Gaps.empty
      ],
    );
  }

  ///下载apk
  Future<void> _doBorrow() async {
    int id = Provider.of<ProductProvider>(context, listen: false).bProductEntity.id!;
    widget.onPressed(id);
    // Toast.show(id.toString());
  }
}
