import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/login2/iviews/login_i_mvp_view.dart';
import 'package:myapp9/pages/login2/presenters/login_page_presenter.dart';
import 'package:myapp9/pages/login2/router/login_router.dart';
import 'package:myapp9/pages/login2/widgets/my_text_field.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/routers/routers.dart';
import 'package:myapp9/util/change_notifier_manage.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';
import 'package:sp_util/sp_util.dart';

import '../../models/index_entity.dart';
import '../../util/toast_utils.dart';
import '../../widgets/load_image.dart';
import '../privacy/router/privacy_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/locale_provider.dart';

/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ChangeNotifierMixin<LoginPage>, BasePageMixin<LoginPage, LoginPagePresenter>, AutomaticKeepAliveClientMixin<LoginPage>
    implements LoginIMvpView {

  bool _clickable = false;

  bool _privacyAgreement = false;

  IndexDataLoginPageInfo? _loginPageInfo;
  late LoginPagePresenter _loginPagePresenter;

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {

  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });

  }

  @override
  LoginPagePresenter createPresenter() {
    _loginPagePresenter = LoginPagePresenter();
    return _loginPagePresenter;
  }

  @override
  void setLoginPageInfo(IndexDataLoginPageInfo info){
    setState(() {
      _loginPageInfo = info;
    });
  }

  ///获取验证码成功
  @override
  void verificationCodesSuccess(String verificationKey) {
  }

  ///登录成功
  @override
  void loginSuccess(AUserEntity userEntity) {
  }

  @override
  void showCaptcha(String captchaKey, String captchaImageContent) {

  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        // actionName: Myapp9Localizations.of(context)!.verificationCodeLogin,
        actionName: _loginPageInfo?.appName ?? '',
        onPressed: () {
          // NavigatorUtils.push(context, LoginRouter.smsLoginPage);
        },
      ),
      body: MyScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody,
      ),
    );
  }

  List<Widget> get _buildBody =>
      <Widget>[
        Gaps.vGap50,
        const LoadAssetImage('login/login_bg2'),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Welcome to ${_loginPageInfo?.appName ?? ''}',
            style: const TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold),
          ),
        ),
        Gaps.vGap24,
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Read our ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  GestureDetector(
                    onTap: () => Utils.launchTelURL(_loginPageInfo?.contactPhone ?? ''),
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text(
                    '. Tap "Agree and continue" to',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'accept the',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  GestureDetector(
                    onTap: () => Utils.launchTelURL(_loginPageInfo?.contactPhone ?? ''),
                    child: Text(
                      'Terms of Service',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text(
                    '.',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        Gaps.vGap24,
        MyButton(
          key: const Key('login'),
          onPressed: () {
            NavigatorUtils.push(context, LoginRouter.loginPhonePage);
            // _privacyAgreement ? _login() : Toast.show(Myapp9Localizations.of(context)!.inputPrivacy);
          },
          text: "Agree and Continue",
        ),

        Gaps.vGap16,
        Gaps.vGap16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                alignment: Alignment.centerRight,
                height: 40.0,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(34.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Icon(Icons.language,color: Colours.app_main,),
                    Text(_sortName),
                    Icon(Icons.arrow_drop_down_sharp,color: Colours.app_main,size: 42,),
                ],),
              ),
              onTap: () {
                _showBottomSheet();
              },
            ),
          ],
        ),
        Gaps.vGap24,

      ];

  String _sortName = '选择语言';
  final List<String> _list = ['English', '简体中文', 'Français', 'español', 'Русский'];
  final List<String> _listLanguange = ['en', 'zh', 'fr', 'es', 'ru'];

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        // 可滑动ListView关闭BottomSheet
        return DraggableScrollableSheet(
          key: const Key('goods_sort'),
          initialChildSize: 0.7,
          minChildSize: 0.65,
          expand: false,
          builder: (_, scrollController) {
            return ListView.builder(
              controller: scrollController,
              itemExtent: 48.0,
              itemBuilder: (_, index) {
                return InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(_list[index]),
                  ),
                  onTap: () {
                    setState(() {
                      _sortName = _list[index];
                    });
                    context.read<LocaleProvider>().setLocale(_listLanguange[index]);
                    NavigatorUtils.goBack(context);
                  },
                );
              },
              itemCount: _list.length,
            );
          },
        );
      },
    );
  }
}
