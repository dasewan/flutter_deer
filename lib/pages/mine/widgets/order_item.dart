import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/constant.dart';
import '../../../models/borrow_list_entity.dart';
import '../../../res/raw/dimens.dart';
import '../../../res/raw/gaps.dart';
import '../../../routers/fluro_navigator.dart';
import '../../../util/other_utils.dart';
import '../../../widgets/my_button.dart';
import '../../repay/router/repay_router.dart';

/// design/4商品/index.html#artboard1
class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.item,
    required this.index,
    required this.selectIndex,
    required this.onTapMenu,
    required this.onTapEdit,
    required this.onTapOperation,
    required this.onTapMenuClose,
    required this.animation,
    // required this.heroTag,
  });

  final BorrowListData item;
  final int index;
  final int selectIndex;
  final VoidCallback onTapMenu;
  final VoidCallback onTapEdit;
  final VoidCallback onTapOperation;
  final VoidCallback onTapMenuClose;
  final Animation<double> animation;

  // final String heroTag;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textTextStyle3 = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp14, color: Colors.grey[500]);
    Map<int, Color> statusColor = {
      //审核中 1
      Constant.MACHINE_WAIT: Colors.grey,
      Constant.MACHINE_ING: Colors.grey,
      Constant.MACHINE_SUCCESS: Colors.grey,
      Constant.REVIEW_WAIT: Colors.grey,
      Constant.REVIEW_SUCCESS: Colors.grey,
      Constant.REVIEW_ING: Colors.grey,
      Constant.LOAN_WAIT: Colors.grey,
      Constant.LOAN_ING: Colors.grey,
      Constant.LOAN_FAIL: Colors.grey,
      Constant.LOAN_REFUSE: Colors.grey,
      Constant.LOAN_INTERCEPT: Colors.grey,
      //已拒绝 2
      Constant.MACHINE_REFUSE: Colors.redAccent,
      Constant.REVIEW_REFUSE: Colors.redAccent,
      // 待还款3
      Constant.REPAY_WAIT: Colors.blue,
      Constant.REPAY_ING: Colors.blue,
      Constant.REPAY_FAIL: Colors.blue,
      // 逾期 4
      Constant.borrow_overdue: Colors.red,
      Constant.OVERDUE_SLIGHT: Colors.red,
      Constant.OVERDUE_MEDIUM: Colors.red,
      Constant.OVERDUE_SERIOUS: Colors.red,
      // 结清5
      Constant.borrow_cleared: Colors.green,
      //关闭6
      Constant.borrow_closed: Colors.blueGrey,
    };
    Map<int, String> statusText = {
      Constant.borrow_verify: "待认证",
      Constant.borrow_sign: "待签约",
      Constant.borrow_machine: "审核中",
      Constant.borrow_review: "审核中",
      Constant.borrow_loan: "审核中",
      Constant.borrow_outstanding: "待还款",
      Constant.borrow_cleared: "已结清",
      Constant.borrow_overdue: "逾期",
      Constant.borrow_closed: "已关闭",
      //审核中 1
      Constant.MACHINE_WAIT: "审核中",
      Constant.MACHINE_ING: "审核中",
      Constant.MACHINE_SUCCESS: "审核中",
      Constant.REVIEW_WAIT: "审核中",
      Constant.REVIEW_SUCCESS: "审核中",
      Constant.REVIEW_ING: "审核中",
      Constant.LOAN_WAIT: "审核中",
      Constant.LOAN_ING: "审核中",
      Constant.LOAN_FAIL: "审核中",
      Constant.LOAN_REFUSE: "审核中",
      Constant.LOAN_INTERCEPT: "审核中",
      //已拒绝 2
      Constant.MACHINE_REFUSE: "已拒绝",
      Constant.REVIEW_REFUSE: "已拒绝",
      // 待还款3
      Constant.REPAY_WAIT: "待还款",
      Constant.REPAY_ING: "待还款",
      Constant.REPAY_FAIL: "待还款",
      // 逾期 4
      Constant.OVERDUE_SLIGHT: "逾期",
      Constant.OVERDUE_MEDIUM: "逾期",
      Constant.OVERDUE_SERIOUS: "逾期",
    };
    final Row child = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
/*        ExcludeSemantics(
          child: Hero(
            tag: heroTag,
            child: LoadImage(item.icon, width: 72.0, height: 72.0),
          ),
        ),*/
        Gaps.hGap8,
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      '订单号：',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTextStyle3,
                    ),
                  ),
                  Text(
                    item.hSn!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Gaps.vGap4,
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      '订单金额：',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTextStyle3,
                    ),
                  ),
                  Text(Utils.formatPrice(item.mBorrowAmount.toString(), format: MoneyFormat.NORMAL))
                ],
              ),
              Gaps.vGap4,
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      '下单时间：',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTextStyle3,
                    ),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(item.createdAt.nullSafe)),
                  )
                ],
              ),
              item.jStatus == 80 || item.jStatus == 90 || item.jStatus == 60 ? Gaps.vGap4 : Gaps.empty,
              item.jStatus == 80
                  ? Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text(
                            '结清时间：',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTextStyle3,
                          ),
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(item.tSettledTime.nullSafe)),
                        )
                      ],
                    )
                  : Gaps.empty,
              item.jStatus == 90 || item.jStatus == 60
                  ? Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: Text(
                            '应还时间：',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTextStyle3,
                          ),
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(item.qExpectRepayTime.nullSafe)),
                        )
                      ],
                    )
                  : Gaps.empty,
            ],
          ),
        ),
        item.jStatus == Constant.borrow_overdue || item.jStatus == Constant.borrow_outstanding
            ? SizedBox(
                height: 84,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      statusText[item.jStatus]!,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: statusColor[item.jStatus]),
                    ),
                    const Expanded(child: Gaps.empty),
                    SizedBox(
                      height: 24,
                      child: MyButton(
                        minWidth: 1,
                        minHeight: 1,
                        radius: 2.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        fontSize: Dimens.font_sp14,
                        backgroundColor: Colors.redAccent[700],
                        onPressed: () {
                          NavigatorUtils.push(context, '${RepayRouter.repay}?borrowId=${item.id}');
                        },
                        text: 'Repay',
                      ),
                    )
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.jStatus == Constant.borrow_cleared || item.jStatus == Constant.borrow_closed
                        ? statusText[item.jStatus]!
                        : statusText[item.kSubStatus]!,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: item.jStatus == Constant.borrow_cleared || item.jStatus == Constant.borrow_closed
                            ? statusColor[item.jStatus]!
                            : statusColor[item.kSubStatus]!),
                  ),
                ],
              )
      ],
    );

    return Stack(
      children: <Widget>[
        // item间的分隔线
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context, width: 0.8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
