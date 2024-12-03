import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/formFieldValidator.dart';
import 'package:myapp9/util/input_formatter/number_text_input_formatter.dart';

/// 封装输入框
class TextFieldItem extends StatefulWidget {

  const TextFieldItem({
    Key? key,
    this.controller,
    this.value,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    required this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? value;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FieldValidator<String?> validator;
  final bool readOnly;

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  double height = 50;

  @override
  Widget build(BuildContext context) {
    if (widget.value != null) {
      /*widget.controller?.value =
          TextEditingValue(text: widget.value!, selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: widget.value!.length)));*/
    }
    final Row child = Row(
      children: <Widget>[
        // Text(title),
        Gaps.hGap16,
        Expanded(
          child: TextFormField(
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            inputFormatters: _getInputFormatters(),
            controller: widget.controller,
            // initialValue: widget.value,
            validator: (value) {
              final String? errorText = widget.validator(value);
              if (errorText == null) {
                setState(() {
                  height = 50;
                });
                return null; // 验证成功，返回null
              } else {
                setState(() {
                  height = 140;
                });
                return errorText; // 验证失败，返回提示信息
              }
            },
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            readOnly: widget.readOnly,
            //style: TextStyles.textDark14,
            decoration: InputDecoration(
              labelText: widget.title,
              hintText: widget.hintText,
              border: InputBorder.none, //去掉下划线
              contentPadding: EdgeInsets.only(top: 14, bottom: 2),
              //hintStyle: TextStyles.textGrayC14
            ),
          ),
        ),
        Gaps.hGap16
      ],
    );

    return Container(
      height: height,
      margin: const EdgeInsets.only(left: 15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        ),
      ),
      child: child,
    );
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (widget.keyboardType == const TextInputType.numberWithOptions(decimal: true)) {
      return <TextInputFormatter>[UsNumberTextInputFormatter()];
    }
    if (widget.keyboardType == TextInputType.number || widget.keyboardType == TextInputType.phone) {
      return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
    }
    return null;
  }
}
