import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/formFieldValidator.dart';
import 'package:myapp9/util/input_formatter/number_text_input_formatter.dart';

/// 封装输入框
class TextFieldItem extends StatefulWidget {
  const TextFieldItem(
      {this.onChanged,
        this.controller,
        this.autofillHints,
        this.keyboardType,
        this.autoFocus = false,
        this.obscureText = false,
        this.textInputAction,
        this.focusNode,
        this.prefixIconData,
        this.hintText,
        this.title,
        this.errorText,
        this.value,
        this.helperText,
        this.showLabelAboveTextField = true,
        this.floatingLabelBehavior = FloatingLabelBehavior.auto,
        this.fillColor,
        this.accentColor,
        this.textColor = Colors.black,
        this.borderRadius = 6,
        required this.validator,
        this.showConfirmation = true,
        this.showError = true,
        this.verticalPadding = 10,
        this.horizontalPadding = 12,
        this.readOnly = false,
        this.onFieldSubmitted,
        Key? key})
      : super(key: key);

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final bool autoFocus;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final IconData? prefixIconData;
  final String? hintText;
  final String? title;
  final String? errorText;
  final String? value;

  /// Text placed below the text field
  final String? helperText;
  final bool showLabelAboveTextField;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Color? fillColor;
  final Color? accentColor;
  final Color textColor;
  final double borderRadius;
  final FieldValidator<String?> validator;
  final bool showConfirmation;
  final bool showError;
  final double verticalPadding;
  final double horizontalPadding;
  final bool readOnly;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  bool hasConfirmation = true;
  bool hasError = false;
  bool hasFocus = false;
  String error = '';

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    textEditingController =
        widget.controller ?? TextEditingController();
  }
  void myValid(){
    hasFocus = false;
    hasConfirmation = textEditingController.text != null ? isValid : false;
    hasConfirmation = isValid;
    hasError = textEditingController != null ? !isValid : false;
    hasError = false;


    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasPrimaryFocus;
        bool valid = isValid;
        hasConfirmation = valid;
        hasError = !valid;
      });
    });
  }

  bool get isValid {
    if (hasValidator) {
      final String? errorText = widget.validator!(textEditingController.text);
      if (errorText == null) {
        return true; // 验证成功，返回null
      } else {
        setState(() {
          error = errorText;
        });
        return false; // 验证失败，返回提示信息
      }
    }
    return false;
  }

  bool get hasValidator {
    return widget.validator != null;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    OutlineInputBorder buildFocusedBorder() {
      if (hasValidator) {
        if (hasConfirmation && widget.showConfirmation) {
          return OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 1.25),
              borderRadius: BorderRadius.circular(widget.borderRadius));
        } else if (hasError) {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.25),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        }
      }
      return OutlineInputBorder(
        borderSide: BorderSide(
            color: widget.accentColor ?? currentTheme.primaryColor,
            width: 1.25),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
    }

    OutlineInputBorder buildEnabledBorder() {
      if (hasValidator) {
        if (hasConfirmation) {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        } else if (hasError) {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        }
      }
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: Colors.grey[400]!,
        ),
      );
    }

    TextStyle? buildLabelStyle() {
      if (hasFocus) {
        return TextStyle(color: widget.accentColor);
      } else {
        return null;
      }
    }

    Icon? buildSuffixIcon() {
      if (hasValidator) {
        if (hasConfirmation) {
          return const Icon(Icons.check, color: Colors.green);
        } else if (hasError) {
          return const Icon(
            Icons.error,
            color: Colors.red,
            size: 24,
          );
        }
      }
      return null;
    }

    return TextSelectionTheme(
      data: TextSelectionThemeData(
        selectionColor: widget.accentColor?.withOpacity(.33) ??
            currentTheme.primaryColor.withOpacity(.33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null && widget.showLabelAboveTextField) ...[
            Text(
              widget.title!,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: hasFocus ? currentTheme.primaryColor : Colors.grey[700],
              ),
            ),
            const SizedBox(height: 6),
          ],
          TextFormField(
            focusNode: focusNode,
            controller: textEditingController,
            autofillHints: widget.autofillHints,
            keyboardType: widget.keyboardType,
            autofocus: widget.autoFocus,
            readOnly: widget.readOnly,
            onFieldSubmitted: widget.onFieldSubmitted,
            validator:(value){myValid;},
            onChanged: (val) {
              setState(() {
                hasError = false;
                hasConfirmation = isValid;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(val);
              }
            },
            style: TextStyle(color: widget.textColor),
            cursorColor: widget.textColor,
            obscureText: widget.obscureText,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.verticalPadding,
                  horizontal: widget.horizontalPadding),
              isDense: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: widget.textColor.withOpacity(.45)),
              labelText:
              widget.showLabelAboveTextField ? null : widget.title,
              labelStyle: buildLabelStyle(),
              errorText: widget.errorText != null && hasError && hasValidator
                  ? widget.errorText
                  : null,
              floatingLabelBehavior: widget.floatingLabelBehavior,
              fillColor: widget.fillColor,
              filled: widget.fillColor != null,
              focusedBorder: buildFocusedBorder(),
              enabledBorder: buildEnabledBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              prefixIcon: widget.prefixIconData != null
                  ? Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 8),
                child: Icon(
                  widget.prefixIconData,
                  color: hasFocus
                      ? widget.accentColor
                      : widget.textColor.withOpacity(.6),
                  size: 20,
                ),
              )
                  : null,
              prefixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
              suffixIcon: buildSuffixIcon(),
            ),
          ),
          if (widget.helperText != null && error == '') ...[
            const SizedBox(height: 6),
            Text(
              widget.helperText!,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
          if (error != '') ...[
            const SizedBox(height: 2),
            Text(
              error,
              style: const TextStyle(
                color: Colors.red,
              ),
            )
          ]
        ],
      ),
    );
  }
}
