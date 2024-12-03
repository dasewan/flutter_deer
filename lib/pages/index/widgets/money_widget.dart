import 'package:flutter/material.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/widgets/rise_number_text.dart';

class MoneyWidget extends StatelessWidget {
  const MoneyWidget({Key? key, required this.title, required this.money, this.alignment, this.moneyTextStyle, this.transfer = true}) : super(key: key);

  final String title;
  final int money;
  final MainAxisAlignment? alignment;
  final TextStyle? moneyTextStyle;
  final bool transfer;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        moneyTextStyle ?? const TextStyle(color: Colours.text_disabled, fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin');
    return MergeSemantics(
      child: Column(
        mainAxisAlignment: alignment ?? MainAxisAlignment.center,
        children: <Widget>[
          /// 横向撑开Column，扩大语义区域
          // const SizedBox(width: double.infinity),
          transfer ? RiseNumberText(money, style: textStyle) : Text(money.toString(), style: textStyle),
          title.isNotEmpty ? Gaps.vGap4 : Gaps.empty,
          title.isNotEmpty ? Text(title, style: const TextStyle(color: Colors.grey, fontSize: Dimens.font_sp14)) : Gaps.empty,
        ],
      ),
    );
  }
}
