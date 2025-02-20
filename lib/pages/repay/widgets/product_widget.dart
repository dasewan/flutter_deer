import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp9/pages/index/widgets/money_widget.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/image_utils.dart';

import '../../../models/borrow_detail_entity.dart';
import '../../../util/other_utils.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    required this.borrow,
    required this.product,
    required this.loan,
    required this.selectedCount,
    required this.selectedAmount,
  }) : super(key: key);

  final BorrowDetailDataBorrow? borrow;
  final BorrowDetailDataProduct? product;
  final BorrowDetailDataLoan? loan;
  final int selectedCount;
  final int selectedAmount;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(end: 1.0, begin: 0).animate(_animationController)
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? textTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12, color: Colors.white);
    final TextStyle? textTextStyle2 = Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white);
    final TextStyle? textTextStyle3 = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12, color: Colors.grey[400]);
    final TextStyle? textTextStyle4 = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp14, color: Colors.grey[400]);
    final Widget front = AspectRatio(
      aspectRatio: 1.65,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ImageUtils.getAssetImage(widget.borrow?.jStatus == 90 ? 'index/bg_overdue' : 'index/bg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            Gaps.vGap8,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: textTextStyle,
                      children: <TextSpan>[
                        const TextSpan(text: 'You have select '),
                        TextSpan(
                          text: widget.selectedCount.toString(),
                          style: textTextStyle2,
                        ),
                        const TextSpan(text: ' terms of amount')
                      ],
                    ),
                  ),
                  Gaps.hGap4,
                  MoneyWidget(
                    title: '',
                    money: widget.selectedAmount,
                    alignment: MainAxisAlignment.center,
                    moneyTextStyle: const TextStyle(color: Colors.white, fontSize: 46.0, fontFamily: 'RobotoThin'),
                  ),
                ],
              ),
            ),
            Gaps.vGap8,
            const FractionallySizedBox(widthFactor: 0.9, child: Gaps.line),
            Gaps.vGap8,
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const SizedBox(width: double.infinity),
                      RichText(
                        text: TextSpan(
                          style: textTextStyle3,
                          children: const <TextSpan>[
                            TextSpan(text: 'Loan amount'),
                          ],
                        ),
                      ),
                      Gaps.vGap4,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Utils.formatPrice2(widget.borrow?.mBorrowAmount != null ? widget.borrow!.mBorrowAmount! as num : 0), style: textTextStyle4),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const SizedBox(width: double.infinity),
                      RichText(
                        text: TextSpan(
                          style: textTextStyle3,
                          children: const <TextSpan>[
                            TextSpan(text: 'Loan Terms'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // const MyTag(color: Colours.orange, text: '专享'),
                          Text("${widget.product?.eLife} ${widget.product?.dUnit == 'd' ? 'Days' : 'Weeks'}", style: textTextStyle4),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const SizedBox(width: double.infinity),
                      RichText(
                        text: TextSpan(
                          style: textTextStyle3,
                          children: const <TextSpan>[
                            TextSpan(text: 'Outstanding'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              "${widget.borrow?.uSettledPeriod != null ? widget.product!.zPeriod! - widget.borrow!.uSettledPeriod! : widget.product?.zPeriod} Periods",
                              style: textTextStyle4),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lightbulb_outline_sharp,
                  color: Colors.white,
                  size: 16,
                ),
                RichText(
                  text: TextSpan(
                    style: textTextStyle,
                    children: const <TextSpan>[
                      TextSpan(text: ' Select the period you need to repay and click Repay  '),
                    ],
                  ),
                ),
              ],
            ),
            Gaps.vGap16,
            Gaps.vGap16,
          ],
        ),
      ),
    );

    // return front;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(pi * _animation.value),
            child: front,
          );
        },
      ),
    );
  }
}
// 自定义 SliverPersistentHeaderDelegate

