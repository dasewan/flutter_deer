import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp8/demo/focus/focus_demo_page.dart';
import 'package:myapp8/demo/lottie/lottie_demo.dart';
import 'package:myapp8/demo/navigator/books_main.dart';
import 'package:myapp8/demo/overlay/overlay_main.dart';
import 'package:myapp8/demo/ripple/ripples_animation_page.dart';
import 'package:myapp8/demo/scratcher/scratch_card_demo_page.dart';
import 'package:myapp8/res/resources.dart';
import 'package:myapp8/util/app_navigator.dart';
import 'package:myapp8/widgets/click_item.dart';
import 'package:myapp8/widgets/my_app_bar.dart';


class DemoPage extends StatefulWidget {

  const DemoPage({super.key});

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏(使用QuickActions进入demo页)
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: 'Demo',
      ),
      body: Column(
        children: <Widget>[
          Gaps.vGap5,
          ClickItem(
            title: 'Overlay',
            onTap: () => AppNavigator.push(context, OverlayDemo()),
          ),
          ClickItem(
            title: 'Focus',
            onTap: () => AppNavigator.push(context, const FocusDemoPage(title: 'Focus Demo')),
          ),
          ClickItem(
            title: 'RipplesAnimation',
            onTap: () => AppNavigator.push(context, const RipplesAnimationPage()),
          ),
          ClickItem(
            title: 'Navigator 2.0',
            onTap: () => AppNavigator.push(context, const NestedRouterDemo()),
          ),
          ClickItem(
            title: 'ScratchCard',
            onTap: () => AppNavigator.push(context, const ScratchCardDemoPage()),
          ),
          ClickItem(
            title: 'Lottie',
            onTap: () => AppNavigator.push(context, const LottieDemo()),
          ),
        ],
      ),
    );
  }
}
