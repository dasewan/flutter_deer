import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
// import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/device_utils.dart';
import 'package:myapp9/util/image_utils.dart';
import 'package:myapp9/util/theme_utils.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sp_util/sp_util.dart';

import '../../config/constant.dart';
import '../../routers/fluro_navigator.dart';

// 简易实现数字滚动效果
class SwiperPage extends StatefulWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> with SingleTickerProviderStateMixin {
  late SwiperController _controller;
  late int _currentIndex;
  StreamSubscription? _subscription;
  final List<String> _guideList = ['verify/swipper/swipper0', 'verify/swipper/swipper1', 'verify/swipper/swipper2'];
  final List<String> _guideTitleList = ['Verify Info', 'Apply For A Loan', 'Repay The Order'];
  final List<String> _guideContentList2 = [
    '1.Follow the steps to complete the certification \n\n2.Please ensure that the authentication information is true and accurate\n\n3.SMS and phone authorization is required, please pass authorization\n',
    '1.Please select your intended product \n\n2.It takes 1 to 2 days to review the application\n\n3.After the review is passed, we will pay you, please pay attention to check\n\n',
    '1.Please repay on time, and you can unlock higher amounts of products after repayment \n\n2.If you are unable to repay on time, you can choose to roll over to avoid affecting your credit\n\n3.After the review is passed, we will pay you, please pay attention to check\n\n'
  ];

  @override
  void initState() {
    _controller = SwiperController();
    _currentIndex = 0;
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      /// 两种初始化方案，另一种见 main.dart
      /// 两种方法各有优劣
      // await SpUtil.getInstance();
      if (SpUtil.getBool(Constant.keySwipper, defValue: true)!) {
        /// 预先缓存图片，避免直接使用时因为首次加载造成闪动
        void _precacheImage(String image) {
          precacheImage(ImageUtils.getAssetImage(image, format: ImageFormat.webp), context);
        }

        _guideList.forEach(_precacheImage);
      }
      _initSplash();
    });

    /// 设置桌面端窗口大小
    // if (Device.isDesktop) {
    //   DesktopWindow.setWindowSize(const Size(400, 800));
    // }
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initSplash() {
    _subscription = Stream.value(1).delay(const Duration(milliseconds: 1500)).listen((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // padding: const EdgeInsets.only(bottom: 120.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: ImageUtils.getAssetImage('verify/swipper/swipper_bg1'),
            fit: BoxFit.fill,
          ),
        ),
        // alignment: Alignment.center,
/*        height: double.infinity,
        width: double.infinity,*/
        child: Swiper(
            loop: false,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 260.0,
                      width: 280.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                        image: DecorationImage(
                          image: ImageUtils.getAssetImage('verify/swipper/swipper$index', format: ImageFormat.png),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      height: 300.0,
                      width: 280.0,
                      decoration: BoxDecoration(
                        color: context.dialogBackgroundColor,
                        // borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0))
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_guideTitleList[index], style: TextStyles.textSize16),
                          Gaps.vGap10,
                          Text(_guideContentList2[index]),
                          // Gaps.vGap32,
                          // _buildButton(context),
                        ],
                      ),
                    ),
                    Container(
                        width: 280.0,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: context.dialogBackgroundColor,
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0))),
                        child: _buildButton(context)),
                  ],
                ),
              );
              // return ImageUtils.getAssetImage('logo$index');
            },
            itemCount: 3,
            controller: _controller),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 110.0,
          height: 36.0,
          child: MyButton(
            text: Myapp9Localizations.of(context)!.next,
            fontSize: Dimens.font_sp16,
            onPressed: () {
              // context.read<UserProvider>().setIndexAction(12);
              // Navigator.pop(context);
              if (_currentIndex == 2) {
                if (SpUtil.getBool(Constant.keySwipper, defValue: true)! || Constant.isDriverTest) {
                  SpUtil.putBool(Constant.keySwipper, false);
                  // _initGuide();
                }
                NavigatorUtils.push(context, VerifyRouter.verifyList, replace: true);
                //todo 跳转到认证列表
                return;
              }
              _controller.next(animation: true);
            },
            textColor: Colors.white,
            backgroundColor: primaryColor,
            disabledTextColor: Colors.white,
            disabledBackgroundColor: Colours.text_gray_c,
            radius: 18.0,
          ),
        )
      ],
    );
  }
}
