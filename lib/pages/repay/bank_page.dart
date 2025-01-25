import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/pages/repay/router/repay_router.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/my_app_bar.dart';

import '../../res/raw/colors.dart';
import '../../res/raw/dimens.dart';
import '../../res/raw/gaps.dart';
import '../../util/device_utils.dart';
import '../../util/image_utils.dart';
import '../../util/other_utils.dart';
import '../../widgets/load_image.dart';

class BankPage extends StatefulWidget {
  const BankPage({Key? key, required this.productId, required this.payType, required this.amount, this.extendDays = 0, this.periods = '', this.sn = ''}) : super(key: key);
  final String productId;
  final String payType;
  final String sn;
  final int amount;
  final int extendDays;
  final String periods;

  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  static const platform = MethodChannel('samples.flutter.io/battery');

  List<String> images = ['banks/mtn', 'banks/airtel', 'banks/vodafone', 'banks/airteltigo', 'banks/other'];
  List<String> banks = ['MTN', 'Airtel', 'Vodafone', 'AirtelTigo', 'Other Payment Method'];
  List<String> bankCode = ['mtn', 'airtel', 'vodafone', 'airteltigo', 'other'];
  Map<String, String> payTypeMap = {"settled": "settled", "extend": "extend", 'part': 'part pay'};

  @override
  void initState() {
    super.initState();

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
  void _launchWebURL(String title, String url) {
    if (Device.isMobile) {
      NavigatorUtils.goWebViewPage(context, title, url);
    } else {
      Utils.launchWebURL(url);
    }
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
      appBar: const MyAppBar(
        centerTitle: 'Checkout',
        backgroundColor: Colors.blueAccent,
        titleColor: Colors.white,
        backImgColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 160,
            alignment: Alignment.center,
            color: Colors.blueAccent,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              RichText(
                text: TextSpan(
                  style: textTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Total amount of ${payTypeMap[widget.payType]} to be paid",
                      style: textTextStyle2,
                    ),
                  ],
                ),
              ),
              Gaps.vGap4,
              RichText(
                text: TextSpan(
                  style: textTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: "GH ",
                      style: textTextStyle2?.copyWith(fontSize: 22),
                    ),
                    TextSpan(
                      text: widget.amount.toString(),
                      style: textTextStyle2?.copyWith(fontSize: 42),
                    ),
                  ],
                ),
              ),
              Gaps.vGap8,
              RichText(
                text: TextSpan(
                  style: textTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Please choose the following payment method to pay",
                      style: textTextStyle2,
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              color: Colors.blueAccent,
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                child: FractionallySizedBox(
                  widthFactor: .95,
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          // return Text("data");
                          return Column(
                            children: [
                              Gaps.vGap16,
                              InkWell(
                                onTap: () {
                                  _launchWebURL('Dasewan', 'https://api.dasewan.cn/checkout/?amount=${widget.amount}&sn=${widget.sn}');
                                  // NavigatorUtils.push(context,
                                  //     '${RepayRouter.methodPay}?productId=${widget.productId}&payType=${widget.payType}&amount=${widget.amount}&extendDays=${widget.extendDays}&bank=${bankCode[index]}&periods=${widget.periods}', clearStack: false);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: ImageUtils.getAssetImage(images[index]),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: const SizedBox(
                                          width: 54,
                                          height: 54,
                                          child: Gaps.empty,
                                        )),
                                    Gaps.hGap10,
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(banks[index], style: const TextStyle(color: Colours.dark_bg_gray, fontSize: Dimens.font_sp16)),
                                          Gaps.vGap8,
                                        ],
                                      ),
                                    ),
                                    const LoadAssetImage('ic_arrow_right', color: Colors.black38, width: 24.0),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


