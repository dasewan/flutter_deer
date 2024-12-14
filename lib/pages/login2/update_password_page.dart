import 'package:flutter/material.dart';
import 'package:myapp9/pages/login2/widgets/my_text_field.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/change_notifier_manage.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:myapp9/util/toast_utils.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';

/// design/1注册登录/index.html#artboard13
class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  _UpdatePasswordPageState createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> with ChangeNotifierMixin<UpdatePasswordPage> {
  //定义一个controller
  final TextEditingController _oldPwdController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _oldPwdController: callbacks,
      _newPwdController: callbacks,
      _nodeText1: null,
      _nodeText2: null,
    };
  }

  void _verify() {
    final String oldPwd = _oldPwdController.text;
    final String newPwd = _newPwdController.text;
    bool clickable = true;
    if (oldPwd.isEmpty || oldPwd.length < 6) {
      clickable = false;
    }
    if (newPwd.isEmpty || newPwd.length < 6) {
      clickable = false;
    }
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _confirm() {
    Toast.show('修改成功！');
    NavigatorUtils.goBack(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Change password',
      ),
      body: MyScrollView(
        keyboardConfig: Utils.getKeyboardActionsConfig(context, <FocusNode>[_nodeText1, _nodeText2]),
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: <Widget>[
          const Text(
            'reset login password',
            style: TextStyles.textBold26,
          ),
          Gaps.vGap8,
          Text(
            'phone 15000000000',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: Dimens.font_sp12),
          ),
          Gaps.vGap32,
          MyTextField(
            isInputPwd: true,
            focusNode: _nodeText1,
            controller: _oldPwdController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Please confirm new login password',
          ),
          Gaps.vGap8,
          MyTextField(
            isInputPwd: true,
            focusNode: _nodeText2,
            controller: _newPwdController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Please input new login password',
          ),
          Gaps.vGap24,
          MyButton(
            onPressed: _clickable ? _confirm : null,
            text: 'Confirm',
          )
        ],
      ),
    );
  }
}
