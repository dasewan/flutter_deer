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
import '../../util/device_utils.dart';
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
    with
        ChangeNotifierMixin<LoginPage>,
        BasePageMixin<LoginPage, LoginPagePresenter>,
        AutomaticKeepAliveClientMixin<LoginPage>
    implements LoginIMvpView {
  String _sortName = 'English';
  bool _privacyAgreement = false;

  IndexDataLoginPageInfo? _loginPageInfo;
  late LoginPagePresenter _loginPagePresenter;

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
  }

  @override
  LoginPagePresenter createPresenter() {
    _loginPagePresenter = LoginPagePresenter();
    return _loginPagePresenter;
  }

  @override
  void setLoginPageInfo(IndexDataLoginPageInfo info) {
    setState(() {
      _loginPageInfo = info;
    });
  }

  ///获取验证码成功
  @override
  void verificationCodesSuccess(String verificationKey) {}

  ///登录成功
  @override
  void loginSuccess(AUserEntity userEntity) {}

  @override
  void showCaptcha(String captchaKey, String captchaImageContent) {}

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<String> list = [
      '${Myapp9Localizations.of(context)!.en} (English)',
      '${Myapp9Localizations.of(context)!.id} (Indonesia)',
      '${Myapp9Localizations.of(context)!.fr} (Français)',
      '${Myapp9Localizations.of(context)!.es} (español)',
      '${Myapp9Localizations.of(context)!.pt} (Português)',
      '${Myapp9Localizations.of(context)!.ru} (Русский)',
      '${Myapp9Localizations.of(context)!.vi} (Tiếng Việt)',
      '${Myapp9Localizations.of(context)!.ja} (日本語)',
      '${Myapp9Localizations.of(context)!.zh_CN} (简体中文)',
    ];
    final List<String> list2 = [
      'English',
      'Indonesia',
      'Français',
      'Español',
      'Português',
      'Русский',
      'Tiếng Việt',
      '日本語',
      '简体中文',
    ];
    final List<String> listLanguange = ['en', 'id', 'fr', 'es', 'pt', 'ru', 'vi', 'ja', 'zh_CN'];
    void _launchWebURL(String title, String url) {
      if (Device.isMobile) {
        NavigatorUtils.goWebViewPage(context, title, url);
      } else {
        Utils.launchWebURL(url);
      }
    }

    void showBottomSheet() {
      showModalBottomSheet<void>(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
        ),
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
                      child: Text(list[index]),
                    ),
                    onTap: () {
                      setState(() {
                        _sortName = list2[index];
                      });
                      context
                          .read<LocaleProvider>()
                          .setLocale(listLanguange[index]);
                      NavigatorUtils.goBack(context);
                    },
                  );
                },
                itemCount: list.length,
              );
            },
          );
        },
      );
    }

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
        children: [
          Gaps.vGap50,
          const LoadAssetImage('login/login_bg2'),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Welcome to ${_loginPageInfo?.appName ?? ''}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold),
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                    ),
                    GestureDetector(
                      onTap: (){
                        _launchWebURL('Privacy Policy', 'https://api.dasewan.cn/privacy.html');
/*                        NavigatorUtils.pushResult(context, PrivacyRouter.privacyPage, (Object result) {
                          setState(() {
                            final bool privacyAgreement = result as bool;
                            _privacyAgreement = privacyAgreement;
                          });
                        });*/
                      },
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Text(
                      '. Tap "Agree and continue" to',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'accept the',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchWebURL('Privacy Policy', 'https://api.dasewan.cn/service.html');
/*                        NavigatorUtils.pushResult(context, PrivacyRouter.privacyPage, (Object result) {
                          setState(() {
                            final bool privacyAgreement = result as bool;
                            _privacyAgreement = privacyAgreement;
                          });
                        });*/
                      },
                      child: Text(
                        'Terms of Service',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Text(
                      '.',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
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
              if(_privacyAgreement){
                NavigatorUtils.push(context, LoginRouter.loginPhonePage);
              }else{
                NavigatorUtils.push(context, LoginRouter.loginPhonePage);
/*                NavigatorUtils.pushResult(context, PrivacyRouter.privacyPage, (Object result) {
                  setState(() {
                    final bool privacyAgreement = result as bool;
                    _privacyAgreement = privacyAgreement;
                  });
                });*/
              }
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
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(34.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.language,
                        color: Colours.app_main,
                      ),
                      Text(_sortName != '' ? _sortName : Myapp9Localizations.of(
                          context)!.chooseLanguage),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colours.app_main,
                        size: 42,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showBottomSheet();
                },
              ),
            ],
          ),
          Gaps.vGap24,
        ],
      ),
    );
  }




}
