import 'package:flutter/material.dart';
import 'package:myapp9/pages/repay/presenters/repay_page_presenter.dart';
import 'package:myapp9/pages/repay/router/repay_router.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/my_app_bar.dart';

import '../../res/raw/colors.dart';
import '../../res/raw/gaps.dart';
import '../../widgets/my_button.dart';

class PartPayPage extends StatefulWidget {
  const PartPayPage({Key? key, required this.productId, required this.step, required this.min, required this.amountRange, required this.periodRange})
      : super(key: key);
  final String productId;
  final int step;
  final int min;
  final List<int> amountRange;
  final List<String> periodRange;

  @override
  _PartPayPageState createState() => _PartPayPageState();
}

class _PartPayPageState extends State<PartPayPage> {
  late RepayPagePresenter _repayPagePresenter;
  String _amountTip = "";
  double _money = 40;
  late List<int> periodIndexs;

  @override
  void initState() {
    super.initState();
    periodIndexs = List.generate(widget.amountRange.length, (index) => index);
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
  }

  @override
  Widget build(BuildContext context) {
    int maxAmount = widget.amountRange[widget.amountRange.length - 1];
    double interval = ((maxAmount - widget.min) / 5000).ceil() * 1000.toDouble();
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: 'Pay in part',
        backgroundColor: Colors.blueAccent,
        titleColor: Colors.white,
        backImgColor: Colors.white,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gaps.vGap24,
            Gaps.vGap50,
            Container(
              alignment: Alignment.center,
              child: const Text(
                "How much do you want to pay?",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Gaps.vGap24,
            Container(
              alignment: Alignment.center,
              child: Text(
                "\$$_money",
                style: const TextStyle(fontSize: 44, color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                _amountTip,
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ),
            Gaps.vGap24,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Text('jiang'),
                ),
              ],
            ),
            Gaps.vGap50,
            Gaps.vGap24,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MyButton(
                radius: 33.0,
                backgroundColor: Colours.app_main,
                onPressed: () {
                  // NavigatorUtils.push(context, RepayRouter.bank, clearStack: false);
                  NavigatorUtils.push(context, '${RepayRouter.bank}?productId=${widget.productId}&payType=part&amount=${_money.floor().toString()}',
                      clearStack: false);
                },
                text: 'Continue',
              ),
            ),
            Gaps.vGap32,
            Gaps.vGap32,
          ],
        ),
      ),
    );
  }
}


