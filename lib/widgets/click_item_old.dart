import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/other_utils.dart';

class ClickItem extends StatelessWidget {

  const ClickItem({
    super.key,
    this.onTap,
    required this.title,
    this.content = '',
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.hintText = '',
    this.tooltip = '',
    this.focusNode,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.status = 0,
    this.height = 50,
    this.margin = const EdgeInsets.only(left: 15.0),
    this.padding = const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
    this.rightChild,
  });

  final GestureTapCallback? onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final int maxLines;
  final String hintText;
  final String tooltip;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final int status;
  final double height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final String? rightChild;

  @override
  Widget build(BuildContext context) {
    Map<int, Color> statusColor = {
      Constant.notYet: Colors.white10,
      Constant.wait: Colors.yellow,
      Constant.success: Colors.green,
      Constant.refuse: Colors.red,
      Constant.review: Colors.blue
    };
    Widget child = Row(
      //为了数字类文字居中
      crossAxisAlignment: maxLines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        Text(title),
        tooltip.isEmpty
            ? Gaps.empty
            : JustTheTooltip(
          content: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              tooltip,
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          isModal: true,
          child: Container(
            width: 20,
            child: Icon(
              color: Colors.grey,
              size: 16,
              Icons.info_outlined,
            ),
          ),
        ),
        // Gaps.hGap10,
        Expanded(
          child: Semantics(
            label: hintText.isEmpty ? '请输入$title' : hintText,
            child: TextField(
              keyboardType: keyboardType,
              controller: controller,
              onChanged: onChanged,
              focusNode: AlwaysDisabledFocusNode(),
              onTap: onTap,
              //style: TextStyles.textDark14,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none, //去掉下划线
                //hintStyle: TextStyles.textGrayC14
              ),
            ),
          ),
        ),
        Gaps.hGap8,
        Opacity(
          // 无点击事件时，隐藏箭头图标
          opacity: onTap == null ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
            child: Images.arrowRight,
          ),
        ),
        Opacity(
          // 无点击事件时，隐藏箭头图标
          opacity: rightChild == null ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
            child: Text(rightChild.nullSafe),
          ),
        )
      ],
    );

    /// 分隔线
    child = Container(
      margin: margin,
      padding: padding,
      height: height,
      // constraints: const BoxConstraints(
      //   maxHeight: double.infinity,
      //   minHeight: 50.0,
      // ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: statusColor[status],
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        ),
      ),
      child: child,
    );

    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
