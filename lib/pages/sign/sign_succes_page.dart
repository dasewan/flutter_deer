import 'package:flutter/material.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/routers/routers.dart';
import 'package:myapp9/widgets/load_image.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';


/// design/2/index.html#artboard2
class SignSuccessPage extends StatefulWidget {
  const SignSuccessPage({Key? key, required this.tip1, required this.tip2, required this.tip3, required this.tip4}) : super(key: key);
  final String tip1;
  final String tip2;
  final String tip3;
  final String tip4;

  @override
  _SignSuccessPageState createState() => _SignSuccessPageState();
}

class _SignSuccessPageState extends State<SignSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Audit Results',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Gaps.vGap50,
            const LoadAssetImage('icon_success',
              width: 80.0,
              height: 80.0,
            ),
            Gaps.vGap12,
            Text(
              widget.tip1,
              style: TextStyles.textSize16,
            ),
            Gaps.vGap8,
            Text(
              widget.tip2,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Gaps.vGap8,
            Text(
              widget.tip3,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Gaps.vGap24,
            MyButton(
              onPressed: () {
                NavigatorUtils.push(context, Routes.home, clearStack: true);
              },
              text: '进入',
            )
          ],
        ),
      ),
    );
  }
}
