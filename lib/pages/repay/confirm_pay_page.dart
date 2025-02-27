import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/repay/iviews/confirm_pay_i_mvp_view.dart';
import 'package:myapp9/pages/repay/presenters/confirm_pay_page_presenter.dart';
import 'package:myapp9/pages/repay/router/repay_router.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/my_app_bar.dart';

import '../../res/raw/colors.dart';
import '../../res/raw/dimens.dart';
import '../../res/raw/gaps.dart';
import '../../util/image_utils.dart';
import '../../widgets/my_button.dart';

class ConfirmPayPage extends StatefulWidget {
  const ConfirmPayPage(
      {Key? key, required this.productId, required this.payType, required this.amount, required this.bank, this.extendDays = 0, this.periods = ''})
      : super(key: key);
  final String productId;
  final String payType;
  final int amount;
  final int extendDays;
  final String bank;
  final String periods;

  @override
  _ConfirmPayPageState createState() => _ConfirmPayPageState();
}

class _ConfirmPayPageState extends State<ConfirmPayPage> with BasePageMixin<ConfirmPayPage, ConfirmPayPagePresenter> implements ConfirmPayIMvpView {
  late ConfirmPayPagePresenter _repayPagePresenter;
  static const platform = MethodChannel('samples.flutter.io/battery');
  Color inputColor = Colors.grey;
  String errorTip = "";
  List<String> bankCode = ['mtn', 'airtel', 'vodafone', 'airteltigo', 'other'];
  Map<String, String> banks = {"mtn": "MTN", "airtel": "Airtel", 'vodafone': 'Vodafone', 'airteltigo': 'AirtelTigo'};
  Map<String, String> images = {"mtn": "banks/mtn", "airtel": "banks/airtel", 'vodafone': 'banks/vodafone', 'airteltigo': 'banks/airteltigo'};

  TextEditingController _bankController = TextEditingController();
  int flex = 1;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }

  @override
  ConfirmPayPagePresenter createPresenter() {
    _repayPagePresenter = ConfirmPayPagePresenter();
    return _repayPagePresenter;
  }

  @override
  void pay() {
    NavigatorUtils.push(context, RepayRouter.repaySuccess, clearStack: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
  }

  @override
  Future<bool> requestOpsPermission() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? textTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12, color: Colors.white);
    final TextStyle? textTextStyle2 = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontSize: Dimens.font_sp14,
        );
    final TextStyle? textTextStyle3 = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12, color: Colors.grey[400]);
    final TextStyle? textTextStyle4 = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp14, color: Colors.grey[400]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(
        centerTitle: 'MTN Repayment',
        backgroundColor: Colors.blueAccent,
        titleColor: Colors.white,
        backImgColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 100),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: ImageUtils.getAssetImage('pay_bg', format: ImageFormat.jpg),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.blueAccent.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Gaps.vGap24,
/*            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Provide your Mobile Money number below for verification",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),*/
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Provide your Mobile Money number below for verification",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ),
            Gaps.vGap12,
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Gaps.vGap12,
                Gaps.vGap12,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _bankController,
                          onTap: () {
                            setState(() {
                              flex = 40;
                              inputColor = Colors.blueAccent;
                            });
                          },
                          onTapOutside: (event) {
                            showToast("onTapOutside");
                            setState(() {
                              flex = 1;
                            });
                          },
                          decoration: InputDecoration(
                            prefixText: "+233 ",
                            prefixStyle: const TextStyle(fontSize: Dimens.font_sp14, color: Colors.blueAccent),
                            labelText: "Enter ${banks[widget.bank]} Mobile Money Number",
                            hintText: "MTN Mobile Money Number",
                            hintStyle: const TextStyle(fontSize: Dimens.font_sp14, color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: ImageUtils.getAssetImage(images[widget.bank]!),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: const SizedBox(
                            width: 46,
                            height: 44,
                            child: Gaps.empty,
                          )),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: inputColor,
                        child: const SizedBox(
                          height: 1,
                        ))),
                errorTip != ''
                    ? Container(
                    width: double.infinity,
                    // padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        child: Text(
                          errorTip,
                          style: const TextStyle(fontSize: Dimens.font_sp12, color: Colors.red),
                        )))
                    : Gaps.empty,
                Gaps.vGap32,
                Gaps.vGap10,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyButton(
                    radius: 33.0,
                    backgroundColor: Colours.app_main,
                    onPressed: () {
                      if (RegExp("^\\d{9}\$", caseSensitive: true).hasMatch(_bankController.text)) {
                        showToast(_bankController.text);
                        setState(() {
                          inputColor = Colors.blueAccent;
                          errorTip = '';
                        });
                      } else {
                        setState(() {
                          inputColor = Colors.red;
                          errorTip = 'The card number you entered is wrong, please re-enter it.';
                        });
                        showToast("The card number you entered is wrong, please re-enter it.");
                      }
                    },
                    text: 'Continue',
                  ),
                ),
                Gaps.vGap32,
              ]),
            ),
/*            Expanded(
              flex: 4,
              child: Container(
                child: Gaps.empty,
              ),
            ),*/
/*            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: ImageUtils.getAssetImage('pay', format: ImageFormat.jpg),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.dstATop),
                    ),
                  ),
                  child: Gaps.empty),
            ),*/
/*            Gaps.vGap32,
            Gaps.vGap32,*/
          ],
        ),
      ),
    );
  }
}

class CustomSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double max; // 最大高度
  final double min; // 最小高度
  final Widget child; // 需要展示的内容

  CustomSliverPersistentHeaderDelegate({required this.max, required this.min, required this.child})
      // 如果 assert 内部条件不成立，会报错
      : assert(max != null),
        assert(min != null),
        assert(child != null),
        assert(min <= max),
        super();

  // 返回展示的内容，如果内容固定可以直接在这定义，如果需要可扩展，这边通过传入值来定义
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override
  double get maxExtent => max; // 返回最大高度

  @override
  double get minExtent => min; // 返回最小高度

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    // 是否需要更新，这里我们定义当高度范围和展示内容被替换的时候进行刷新界面
    return max != oldDelegate.max || min != oldDelegate.min || child != oldDelegate.child;
  }
}
