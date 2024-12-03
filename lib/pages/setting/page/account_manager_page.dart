import 'package:flutter/material.dart';

import '../../../routers/fluro_navigator.dart';
import '../../../widgets/click_item.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/my_app_bar.dart';
import '../../login/router/login_router.dart';

/// design/8设置/index.html#artboard1
class AccountManagerPage extends StatefulWidget {
  const AccountManagerPage({super.key});

  @override
  _AccountManagerPageState createState() => _AccountManagerPageState();
}

class _AccountManagerPageState extends State<AccountManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: 'Account Manage',
      ),
      body: Column(
        children: <Widget>[

          ClickItem(
              title: 'Change password',
              content: 'for login',
              onTap: () => NavigatorUtils.push(context, LoginRouter.updatePasswordPage)
          ),
          const ClickItem(
            title: 'Phone',
            content: '15000000000',
          ),
        ],
      ),
    );
  }
}
