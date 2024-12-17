import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/formFieldValidator.dart';
import 'package:myapp9/util/input_formatter/number_text_input_formatter.dart';

/// 封装输入框
class TextFieldItem extends StatefulWidget {

  const TextFieldItem({
    super.key,
    this.controller,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    required this.validator, this.value,
  });

  final TextEditingController? controller;
  final String? value;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final List<FieldValidator> validator;
  final bool readOnly;

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  String? error;

  OutlineInputBorder buildFocusedBorder() {
    if (error == null ) {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.25),
        borderRadius: BorderRadius.circular(6),
      );
    }
    if (error != '') {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1.25),
        borderRadius: BorderRadius.circular(6),
      );
    }

    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green, width: 1.25),
        borderRadius: BorderRadius.circular(6));

  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null) {
      /*widget.controller?.value =
          TextEditingValue(text: widget.value!, selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: widget.value!.length)));*/
    }
    final Row child = Row(
      children: <Widget>[
        // Text(title),
        // Gaps.hGap16,
        Expanded(
          child: TextFormField(
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            inputFormatters: _getInputFormatters(),
            controller: widget.controller,
            // initialValue: widget.value,
            validator: (value) {
              for(FieldValidator validator in widget.validator ){
                final String? errorText = validator(value);
                if (errorText == null) {
                  setState(() {
                  });

                } else {
                  setState(() {
                  });
                  return errorText; // 验证失败，返回提示信息
                }
              }
              return null; // 验证成功，返回null

            },
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            readOnly: widget.readOnly,
            //style: TextStyles.textDark14,
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
                borderRadius: BorderRadius.circular(6),
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
              // suffixIcon: buildSuffixIcon(),
            ),
          ),
        ),
        // Gaps.hGap16
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            // color: hasFocus ? currentTheme.primaryColor : Colors.grey[700],
          ),
        ),
        Container(
          // height: height,
          // margin: const EdgeInsets.only(left: 15.0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context, width: 0.6),
            ),
          ),
          child: child,
        ),
        Text(
          error ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        ),
      ],
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
