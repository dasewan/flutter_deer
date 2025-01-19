import 'package:flutter/material.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/routers/routers.dart';
import 'package:myapp9/widgets/load_image.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';

/// design/2/index.html#artboard2
class RepaySuccessPage extends StatefulWidget {
  const RepaySuccessPage({Key? key}) : super(key: key);

  @override
  _RepaySuccessPageState createState() => _RepaySuccessPageState();
}

class _RepaySuccessPageState extends State<RepaySuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: '审核结果',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Gaps.vGap50,
            const LoadAssetImage(
              'icon_success',
              width: 80.0,
              height: 80.0,
            ),
            Gaps.vGap12,
            const Text(
              '您的资料正在审核中',
              style: TextStyles.textSize16,
            ),
            Gaps.vGap8,
            Text(
              '2021-02-21 15:20:10',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Gaps.vGap8,
            Text(
              '预计审核完成时间：02月28日',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Gaps.vGap24,
            MyButton(
              onPressed: () {
                NavigatorUtils.push(context, Routes.home, clearStack: true);
              },
              text: 'Next',
            )
          ],
        ),
      ),
    );
  }
}
