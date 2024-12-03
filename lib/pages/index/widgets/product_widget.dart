import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/providers/product_provider.dart';
import 'package:myapp9/providers/user_provider.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/image_utils.dart';
import 'package:provider/provider.dart';

import '../../../util/device_utils.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/my_button.dart';
import 'money_widget.dart';


class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    required this.bProduct,
    required this.lock,
    required this.yIndexAction,
    required this.actionRoute,
    required this.onPressed,
    this.noAction = false,
    this.borrowId,
    this.borrowStatus,
  }) : super(key: key);

  final BProductEntity bProduct;
  final bool lock;
  final int yIndexAction;
  final String actionRoute;
  final bool noAction;
  final Function(int, int) onPressed;
  final int? borrowId;
  final int? borrowStatus;

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
    final List<String> merchant = ['quick loan', 'easy loan', 'fast loan', 'my money', 'my money', 'my money', 'my money'];
    final TextStyle? textTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12, color: Colors.white);
    final TextStyle? textTextStyle2 = Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white);
    final Widget front = AspectRatio(
      aspectRatio: 1.48,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Consumer<UserProvider>(builder: (_, provider, __) {
            int randomInt = Random().nextInt(3);
            print(randomInt);
            String btnText = '';
            if (widget.lock == true) {
              btnText = "DETAIL";
            } else if (provider.indexAction == 11) {
              btnText = 'APPLY';
            } else if (provider.indexAction == 12) {
              btnText = 'VERIFY';
            } else if (provider.indexAction == 13) {
              btnText = 'LIVENESS';
            } else if (provider.indexAction == 14) {
              btnText = 'SIGN';
            } else if (provider.indexAction == 13) {
              btnText = 'APPLY';
            } else if (provider.indexAction == 13) {
              btnText = 'APPLY';
            } else if (provider.indexAction == 41 || provider.indexAction == 42 || provider.indexAction == 43 || provider.indexAction == 44) {
              btnText = 'REPAY';
            }
            return Column(
              children: <Widget>[
                Gaps.vGap12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gaps.hGap8,
                    LoadAssetImage('merchant/m${Random().nextInt(6)}', width: 80),
                    Gaps.hGap10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Fast Loan',
                            style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
                          ),
                          tagsWidget(randomInt),
                        ],
                      ),
                    )
                  ],
                ),
                Gaps.vGap15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MoneyWidget(
                      title: 'Max Loan Amount',
                      money: widget.bProduct.cAmount ?? 0,
                      alignment: MainAxisAlignment.end,
                      moneyTextStyle: TextStyle(color: Colors.deepOrange[400], fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        /// 横向撑开Column，扩大语义区域
                        // const SizedBox(width: double.infinity),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.bProduct.eLife.toString(),
                                style: TextStyle(color: Colors.black54, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
                              ),
                              TextSpan(
                                text: widget.bProduct.dUnit == 'd' ? ' Days' : (widget.bProduct.dUnit == 'w' ? 'Week' : 'Month'),
                                style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
                              )
                            ],
                          ),
                        ),
                        Gaps.vGap4,
                        Text("Loan Terms", style: const TextStyle(color: Colors.grey, fontSize: Dimens.font_sp14)),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap16,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.6, color: Colors.white),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: MyButton(
                    textColor: Colors.white,
                    disabledTextColor: Colors.white,
                    disabledBackgroundColor: Colours.text_gray_c,
                    radius: 23.0,
                    minWidth: 260,
                    onPressed: () {
                      if (widget.lock == true && _animationStatus == AnimationStatus.dismissed) {
                        _animationController.forward();
                      } else {
                        context.read<ProductProvider>().setBProductEntity(widget.bProduct);
                        widget.onPressed(widget.bProduct.id!, provider.indexAction);
                      }
                    },
                    text: btnText,
                  ),
                ),
                randomInt == 0
                    ? Text("Instant disburse in 10 mins", style: const TextStyle(color: Colors.grey, fontSize: Dimens.font_sp10))
                    : Text("Contact Us", style: const TextStyle(color: Colors.grey, fontSize: Dimens.font_sp10)),
              ],
            );
          })),
    );
    final Widget back = AspectRatio(
      aspectRatio: 1.15,
      child: InkWell(
        onTap: () {
          if (widget.lock == true && _animationStatus == AnimationStatus.completed) {
            _animationController.reverse();
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ImageUtils.getAssetImage('index/bg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(pi),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: <Widget>[
                    MoneyWidget(
                      title: '贷款金额(元)',
                      money: widget.bProduct.cAmount ?? 0,
                      alignment: MainAxisAlignment.end,
                      transfer: false,
                      moneyTextStyle: const TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
                    ),
                    Gaps.vGap8,
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(width: double.infinity),
                          RichText(
                            text: TextSpan(
                              style: textTextStyle,
                              children: <TextSpan>[
                                const TextSpan(text: '贷款周期'),
                                TextSpan(
                                  text: widget.bProduct.eLife.toString(),
                                  style: textTextStyle2,
                                ),
                                TextSpan(text: widget.bProduct.dUnit == 'd' ? '天' : (widget.bProduct.dUnit == 'w' ? '周' : '月'))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // const MyTag(color: Colours.orange, text: '专享'),
                              // ProductTag(text:widget.bProduct.)
                              Text("日利率低至${widget.bProduct.gInterest}%"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                      child: const Text(
                          'Your credit is insufficient, you can only borrow other products, please maintain a good credit before you can receive this product',
                          style: TextStyle(color: Colours.red, fontSize: Dimens.font_sp16)),
                    ),
                    Gaps.vGap24,
                  ],
                ),
                Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/images/index/lock.png',
                    width: 250,
                    height: 250,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    // return front;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(pi * _animation.value),
            child: _animation.value <= 0.5 ? front : back,
          );
        },
      ),
    );
  }

  Widget tagsWidget(status) {
    if (status == 1) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            'Expect repay day: 2024-02-21',
            style: TextStyle(color: Colors.green, fontSize: Dimens.font_sp10),
          ));
    } else if (status == 2) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            'You have overdue 3 days',
            style: TextStyle(color: Colors.red, fontSize: Dimens.font_sp10),
          ));
    } else {
      return Container(
        child: Wrap(
          spacing: 3.0, // 主轴(水平)方向间距
          runSpacing: 3.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start, //沿主轴方向居中
          children: <Widget>[
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'Low interest rates',
                  style: TextStyle(color: Colors.blue, fontSize: Dimens.font_sp10),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'Flexible Installments',
                  style: TextStyle(color: Colors.blue, fontSize: Dimens.font_sp10),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'High Loan Amounts',
                  style: TextStyle(color: Colors.blue, fontSize: Dimens.font_sp10),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'Flexible Repayment Options',
                  style: TextStyle(color: Colors.blue, fontSize: Dimens.font_sp10),
                )),
          ],
        ),
      );
    }
  }
}

class _GoodsItemTag extends StatelessWidget {
  const _GoodsItemTag({
    required this.color,
    required this.text,
  });

  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      margin: const EdgeInsets.only(right: 4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2.0),
      ),
      height: 16.0,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: Dimens.font_sp10,
          height: Device.isAndroid ? 1.1 : null,
        ),
      ),
    );
  }
}
