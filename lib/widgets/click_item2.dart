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
  String? error;
  double borderRadius = 6;




  OutlineInputBorder buildFocusedBorder() {
    if (error == null ) {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.25),
        borderRadius: BorderRadius.circular(borderRadius),
      );
    }
    if (error != '') {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1.25),
        borderRadius: BorderRadius.circular(borderRadius),
      );
    }

    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green, width: 1.25),
        borderRadius: BorderRadius.circular(borderRadius));

  }

  Icon? buildSuffixIcon() {
    if (error == null ) {
      return const Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey);
    }
    if (error != '') {
      return const Icon(Icons.error, color: Colors.red);
    }
    return const Icon(Icons.check, color: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Color> statusColor = {10: Colors.white10, 20: Colors.green, 30: Colors.red};
    Widget child = Row(
      //为了数字类文字居中
      children: <Widget>[
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
                    error = '';
                  });
                } else {
                  setState(() {
                    error = errorText;
                  });
                  return errorText;
                }
              }
              return null; // 验证成功，返回null

            },

            onTap: widget.onTap,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 12),
              isDense: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.black.withOpacity(.45)),
              // labelText:
              // widget.showLabelAboveTextField ? null : widget.labelText,
              // labelStyle: buildLabelStyle(),
              // errorText: widget.errorText != null && hasError && hasValidator
              //     ? widget.errorText
              //     : null,
              // floatingLabelBehavior: widget.floatingLabelBehavior,
              // fillColor: widget.fillColor,
              // filled: widget.fillColor != null,
              focusedBorder: buildFocusedBorder(),
              enabledBorder: buildFocusedBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              // prefixIcon: widget.prefixIconData != null
              //     ? Padding(
              //   padding: const EdgeInsets.only(left: 12.0, right: 8),
              //   child: Icon(
              //     widget.prefixIconData,
              //     color: hasFocus
              //         ? widget.accentColor
              //         : widget.textColor.withOpacity(.6),
              //     size: 20,
              //   ),
              // )
              //     : null,
              prefixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
              suffixIcon: buildSuffixIcon(),
            ),
          ),
        ),
        // Gaps.hGap8,
        // Opacity(
        //   // 无点击事件时，隐藏箭头图标
        //   opacity: widget.onTap == null ? 0 : 1,
        //   child: Padding(
        //     padding: EdgeInsets.only(top: widget.maxLines == 1 ? 0.0 : 2.0),
        //     child: Images.arrowRight,
        //   ),
        // ),
        // Opacity(
        //   // 无点击事件时，隐藏箭头图标
        //   opacity: widget.rightChild == null ? 0 : 1,
        //   child: Padding(
        //     padding: EdgeInsets.only(top: widget.maxLines == 1 ? 0.0 : 2.0),
        //     child: Text(widget.rightChild.nullSafe),
        //   ),
        // )
      ],
    );

    /// 分隔线
    child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Gaps.hGap4,
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        Gaps.vGap4,
        Container(
          // margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: statusColor[widget.status],
            border: Border(
              bottom: Divider.createBorderSide(context, width: 0.6),
            ),
          ),
          child: child,
        ),
        Row(
          children: [
            Gaps.hGap4,
            Text(
              error ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ],
        ),
        if (error != null && error != '') Gaps.vGap8 else Gaps.empty,
      ],
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
