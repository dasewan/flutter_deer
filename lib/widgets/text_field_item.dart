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
  double borderRadius = 6;
  double bottomMargin = 0;



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
      return null;
    }
    if (error != '') {
      return const Icon(Icons.error, color: Colors.red);
    }
    return const Icon(Icons.check, color: Colors.green);
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
                    error = '';
                    bottomMargin = 0;
                  });


                } else {
                  setState(() {
                    error = errorText;
                    bottomMargin = -19;
                  });
                  return errorText;

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
              errorStyle: TextStyle(fontSize: 6,color: Colors.transparent, ),
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
        // Gaps.hGap16
      ],
    );

    return Column(
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
        SizedBox(height: 2),
        Container(
          // height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context, width: 0.6),
            ),
          ),
          child: child,
        ),
        Gaps.vGap4,
        if (error != null && error != '') Container(
          transform: Matrix4.translationValues(0, bottomMargin, 0),
          child: Row(
            children: [
              Gaps.hGap4,
              Text(
                error!,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ) else Gaps.empty,
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
