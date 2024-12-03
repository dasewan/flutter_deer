import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../generated/d_borrow_index_entity.dart';
import '../../../res/raw/colors.dart';
import '../../../res/raw/dimens.dart';
import '../../../res/raw/gaps.dart';
import '../../../widgets/my_card.dart';

const List<String> orderLeftButtonText = ['拒单', '拒单', '订单跟踪', '订单跟踪', '订单跟踪'];
const List<String> orderRightButtonText = ['接单', '开始配送', '完成', '', ''];
const Map<int, String> statusMap = {
  10: "Review",
  20: "Review",
  30: "Review",
  40: "Review",
  50: "Review",
  60: "Repay",
  80: "Settled",
  90: "Overdued",
  110: "Closed"
};

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.data,
  });

  final DBorrowIndexData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: MyCard(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              // onTap: () => NavigatorUtils.push(context, OrderRouter.orderInfoPage),
              child: _buildContent(context),
            ),
          ),
        ));
  }

  Widget _buildContent(BuildContext context) {
    final TextStyle? textTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12);
    String statusText = "Under Review";
    String dateText = "We will review with in 2 days";
    String date = "";
    Color color = Colors.blue;
    if (data.jStatus == 60) {
      DateTime dateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSz").parseUtc(data.qExpectRepayTime!);

      DateTime now = DateTime.now();
      Duration difference = dateTime.difference(now);
      int days = difference.inDays;
      statusText = "Due in $days Days";
      color = Colors.indigoAccent;
      dateText = "Due Date:";
      date = DateFormat("yyyy-MM-dd").format(dateTime);
    } else if (data.jStatus == 90) {
      DateTime dateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSz").parseUtc(data.qExpectRepayTime!);
      DateTime now = DateTime.now();
      Duration difference = now.difference(dateTime);
      int days = difference.inDays;
      statusText = "$days Days Overdue:";
      color = Colors.red;
      dateText = "Due Date";
      date = DateFormat("yyyy-MM-dd").format(dateTime);
    } else if (data.jStatus == 80) {
      statusText = "Settled";
      color = Colors.green;
      dateText = "Clear Date:";
      date = DateFormat("yyyy-MM-dd").format(DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSz").parseUtc(data.createdAt!));
    } else if (data.jStatus == 110) {
      statusText = "Closed";
      color = Colors.grey;
      dateText = "Close Date:";
      date = DateFormat("yyyy-MM-dd").format(DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSz").parseUtc(data.createdAt!));
    }
    if (data.kSubStatus == 3040 || data.kSubStatus == 4040) {
      statusText = "Rejected";
      color = Colors.grey;
      dateText = "Rejected Date:";
      date = DateFormat("yyyy-MM-dd").format(DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSz").parseUtc(data.createdAt!));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: textTextStyle,
                  children: <TextSpan>[
                    const TextSpan(text: 'Order SN'),
                    TextSpan(text: '  ${data.hSn!}', style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
            ),
            Text(
              statusText,
              style: TextStyle(
                fontSize: Dimens.font_sp12,
                color: color,
              ),
            ),
          ],
        ),
        Gaps.vGap8,
        Gaps.line,
        Gaps.vGap8,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: textTextStyle,
                    children: <TextSpan>[
                      const TextSpan(text: 'Order Amount:'),
                      TextSpan(text: '  \$${data.mBorrowAmount}', style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ),
                Gaps.vGap8,
                RichText(
                  text: TextSpan(
                    style: textTextStyle,
                    children: <TextSpan>[
                      TextSpan(text: dateText),
                      TextSpan(text: '  $date', style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Gaps.empty,
                  ),
                  data.jStatus == 60 || data.jStatus == 90
                      ? OrderItemButton(
                          text: "Repay",
                          textColor: Colours.text,
                          bgColor: Colours.app_main,
                          onTap: () {
                            // NavigatorUtils.push(context, OrderRouter.orderTrackPage);
                          },
                        )
                      : Gaps.empty,
                ],
              ),
            ),
          ],
        ),

/*        Row(
          children: <Widget>[
            const Expanded(
              child: Gaps.empty,
            ),
            OrderItemButton(
              text: "Repay",
              textColor:  Colours.text,
              bgColor: Colours.app_main,
              onTap: () {
                  // NavigatorUtils.push(context, OrderRouter.orderTrackPage);
              },
            ),
          ],
        ),*/
        Gaps.vGap8,
      ],
    );
  }
}

class OrderItemButton extends StatelessWidget {
  const OrderItemButton({super.key, this.bgColor, this.textColor, required this.text, this.onTap});

  final Color? bgColor;
  final Color? textColor;
  final GestureTapCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        constraints: const BoxConstraints(
          minWidth: 64.0,
          maxHeight: 30.0,
          minHeight: 30.0,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: Dimens.font_sp14, color: textColor),
        ),
      ),
    );
  }
}
