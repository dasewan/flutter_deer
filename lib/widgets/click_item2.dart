import 'package:flutter/material.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/formFieldValidator.dart';
import 'package:myapp9/util/other_utils.dart';

class ClickItem2 extends StatefulWidget {
  const ClickItem2({
    Key? key,
    this.onTap,
    required this.title,
    this.content = '',
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.hintText = '',
    this.focusNode,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.status = 0,
    this.rightChild,
    required this.validator,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final int maxLines;
  final String hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final int status;
  final String? rightChild;
  final List<FieldValidator> validator;

  @override
  State<ClickItem2> createState() => _ClickItem2State();
}

class _ClickItem2State extends State<ClickItem2> {
  double height = 50;

  @override
  Widget build(BuildContext context) {
    Map<int, Color> statusColor = {10: Colors.white10, 20: Colors.green, 30: Colors.red};
    Widget child = Row(
      //为了数字类文字居中
      crossAxisAlignment: widget.maxLines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        // Text(title),
        // const Spacer(),
        // Gaps.hGap16,
        // Expanded(
        //   flex: 4,
        //   child: Text(
        //     content,
        //     maxLines: maxLines,
        //     textAlign: maxLines == 1 ? TextAlign.right : textAlign,
        //     overflow: TextOverflow.ellipsis,
        //     style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: Dimens.font_sp14),
        //   ),
        // ),
        // Text(title),
        Gaps.hGap16,
        Expanded(
          child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            onChanged: widget.onChanged,
            focusNode: AlwaysDisabledFocusNode(),
            validator: (value) {
              for(FieldValidator validator in widget.validator ){
                final String? errorText = validator(value);
                if (errorText == null) {
                  setState(() {
                    height = 50;
                  });

                } else {
                  setState(() {
                    height = 140;
                  });
                  return errorText; // 验证失败，返回提示信息
                }
              }
              return null; // 验证成功，返回null

            },

            onTap: widget.onTap,
            //style: TextStyles.textDark14,
            decoration: InputDecoration(
              labelText: widget.title,
              hintText: widget.hintText,
              border: InputBorder.none, //去掉下划线
              //hintStyle: TextStyles.textGrayC14
            ),
          ),
        ),
        Gaps.hGap8,
        Opacity(
          // 无点击事件时，隐藏箭头图标
          opacity: widget.onTap == null ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(top: widget.maxLines == 1 ? 0.0 : 2.0),
            child: Images.arrowRight,
          ),
        ),
        Opacity(
          // 无点击事件时，隐藏箭头图标
          opacity: widget.rightChild == null ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(top: widget.maxLines == 1 ? 0.0 : 2.0),
            child: Text(widget.rightChild.nullSafe),
          ),
        )
      ],
    );

    /// 分隔线
    child = Container(
      margin: const EdgeInsets.only(left: 15.0),
      padding: const EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),
      height: height,
      // constraints: const BoxConstraints(
      //   maxHeight: double.infinity,
      //   minHeight: 50.0,
      // ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: statusColor[widget.status],
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        ),
      ),
      child: child,
    );

    return InkWell(
      onTap: widget.onTap,
      child: child,
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
