import 'package:flutter/material.dart';
import 'package:myapp9/res/raw/styles.dart';
import 'package:sp_util/sp_util.dart';

import '../../../routers/fluro_navigator.dart';
import '../../../widgets/base_dialog.dart';
import '../../login/router/login_router.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({
    super.key,
  });

  @override
  _ExitDialog createState() => _ExitDialog();
}

class _ExitDialog extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: 'Warn',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text('Are you sure you want to log out?', style: TextStyles.textSize16),
      ),
      onPressed: () {
        SpUtil.clear();
        NavigatorUtils.push(context, LoginRouter.loginPage, clearStack: true);
      },
    );
  }
}
