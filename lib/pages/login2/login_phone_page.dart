import 'dart:convert';

import 'package:advance_country_picker/advance_country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/login2/iviews/login_i_mvp_view.dart';
import 'package:myapp9/pages/login2/presenters/login_page_presenter.dart';
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
import 'package:myapp9/pages/login2/router/login_router.dart';

/// design/1注册登录/index.html
class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPhonePage>
    with ChangeNotifierMixin<LoginPhonePage>, BasePageMixin<LoginPhonePage, LoginPagePresenter>, AutomaticKeepAliveClientMixin<LoginPhonePage>
    implements LoginIMvpView {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _vCodeController = TextEditingController();
  final TextEditingController _captchaController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  bool _clickable = false;
  bool _codeClickable = false;
  String _verificationKey = '';
  String _captchaKey = '';
  bool _captchaVisable = false;
  bool _privacyAgreement = false;
  bool _isSendCode = false;
  bool _phoneCorrect = false;
  bool _otpLengthCorrect = false;
  IndexDataLoginPageInfo? _loginPageInfo;
  late LoginPagePresenter _loginPagePresenter;
  Image _image = Image.memory(Uint8List(0));
  Country? country;



  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _phoneController: callbacks,
      _nodeText1: null,
    };
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
    _phoneController.text = SpUtil.getString(Constant.phone).nullSafe;

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
    _verificationKey = verificationKey;
  }

  ///登录成功
  @override
  void loginSuccess(AUserEntity userEntity) {
    SpUtil.putString(Constant.phone, _phoneController.text);
    // showToast("登录成功");
    NavigatorUtils.push(context, Routes.home, replace: true);
  }

  @override
  void showCaptcha(String captchaKey, String captchaImageContent) {
    setState(() {
      _captchaVisable = true;
    });
    _captchaKey = captchaKey;
    List<int> imageBytes = base64Decode(captchaImageContent.split(",").last);
    Uint8List uint8List = Uint8List.fromList(imageBytes);
    _image = Image.memory(uint8List);
  }

  @override
  bool get wantKeepAlive => true;

  ///验证表单输入格式是否正确
  void _verify() {
    final String name = _phoneController.text;
    final String password = _vCodeController.text;
    bool clickable = true;
    bool codeClickable = false;
    bool phoneCorrect = false;
    bool otpLengthCorrect = false;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
      phoneCorrect = false;
    } else {
      codeClickable = true;
      phoneCorrect = true;
      if(_loginPageInfo!.captchaShowCount! == 0){
        _captcha();
        FocusScope.of(context).requestFocus(_nodeText3);
      }else{
        FocusScope.of(context).requestFocus(_nodeText2);

      }
    }
    if (password.isEmpty || password.length < 4) {
      clickable = false;
      otpLengthCorrect = false;
    } else {
      otpLengthCorrect = true;
    }

    if (phoneCorrect != _phoneCorrect) {
      setState(() {
        _phoneCorrect = phoneCorrect;
      });
    }
    if (otpLengthCorrect != _otpLengthCorrect) {
      setState(() {
        _otpLengthCorrect = otpLengthCorrect;
      });
    }
    //状态不一样再刷新，避免不必要的setState
/*    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }*/

    //发送otp是否可以点击
    if (codeClickable != _codeClickable) {
      setState(() {
        _codeClickable = codeClickable;
      });
    }
  }

  ///发送验证码
  Future<bool> _verificationCodes() async {
    final String phone = _phoneController.text;
    final String captchaCode = _captchaController.text;
    _isSendCode = await _loginPagePresenter.verificationCodes(phone, false, captchaKey: _captchaKey, captchaCode: captchaCode);
    return _isSendCode;
  }

  ///发送图片验证码
  Future<bool> _captcha() async {
    final String phone = _phoneController.text;
    return await _loginPagePresenter.captchas(phone, false);
  }

  ///登录
  void _login() {
    SpUtil.putString(Constant.phone, _phoneController.text);
    final String name = _phoneController.text;
    SpUtil.putString(Constant.phone, name);
  }

  void _showCallPhoneDialog(BuildContext context, String phone, String dialCode) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('We will be verifying the phone number:'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Gaps.vGap12,
              const Text('We will be verifying the phone number:', style: TextStyle(fontSize: 16.0),),
              Gaps.vGap12,
              Text('(${country?.dialCode != null ? country!.dialCode : ''})  $phone', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),),
              Gaps.vGap12,
              const Text('Is this OK, or would you like to edit the number?', style: TextStyle(fontSize: 16.0)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => NavigatorUtils.goBack(context),
              child: const Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                NavigatorUtils.push(context, '${LoginRouter.loginPinPage}?phone=$phone&dialCode=${country!.dialCode}', replace: true);
              },
              style: ButtonStyle(
                // 按下高亮颜色
                overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.error.withOpacity(0.2)),
              ),
              child: Text('OK', style: TextStyle(color: Theme.of(context).colorScheme.error),),
            ),
          ],
        );
      },
    );
  }


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
        children: [
          Gaps.vGap8,
          Text(
            _loginPageInfo?.firstTip ?? '',
            style: const TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w900, fontFamily: 'RobotoThin'),
          ),
          Gaps.vGap8,
          Text(
            _loginPageInfo?.secondTip ?? '',
            style: const TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w900, fontFamily: 'RobotoThin'),
          ),
          Gaps.vGap24,
          Text(
            '${_loginPageInfo?.appName ?? ''} will send an SMS message to verify your phone number.',
            style: TextStyle(color: Colors.grey, fontSize: 12.0,),
          ),
          Gaps.vGap4,
          const Text(
            'Enter your country code and phone number to continue',
            style: TextStyle(color: Colors.grey, fontSize: 12.0,),
          ),
          Gaps.vGap24,
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Gaps.hGap12,
                  Container(
                    width: 40,
                    alignment: Alignment.center,
                    child: country?.flag != null ? Image.asset(
                       country!.flag,
                      package: countryCodePackageName,
                      width: 32,
                      height: 32,
                    ) : null,
                  ),
                  Gaps.hGap12,
                  Container(
                    width: 1,
                    height: 30,
                    color:  Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Gaps.hGap12,
                  Expanded(
                    child: Text(country?.name != null ? country!.isoShortNameByLocale[context.read<LocaleProvider>().locale!.languageCode]! : 'Choose a country'),
                  ),
                  Gaps.hGap12,
                  Icon(Icons.arrow_drop_down_sharp,color: country?.name != null ? Colors.grey : Colours.app_main,size: 42,),
                  Gaps.hGap12,
                ],
              ),
            ),
            onTap: () async {
              country = await AdvanceCountryPicker().showCountryPickerSheet(context, local: context.read<LocaleProvider>().locale!.languageCode);
              setState(() {
                country = country;
              });
            },
          ),
          Gaps.vGap16,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Gaps.hGap12,
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Text(
                    country?.dialCode != null ? country!.dialCode : '',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Gaps.hGap12,
                Container(
                  width: 1,
                  height: 30,
                  color:  Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                ),
                Gaps.hGap12,
                Expanded(
                  child: MyTextField(
                      key: const Key('phone'),
                      focusNode: _nodeText1,
                      controller: _phoneController,
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      hintText: Myapp9Localizations.of(context)!.inputUsernameHint,
                  ),
                ),
                Gaps.hGap12,
                Gaps.hGap12,
              ],
            ),
          ),
          Visibility(visible: _captchaVisable,child: Gaps.vGap16),
          Opacity(
            opacity: _captchaVisable ? 1 : 0,
            child: Container(
              height: _captchaVisable ? 28 : 0,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: MyTextField(
                focusNode: _nodeText3,
                controller: _captchaController,
                maxLength: 6,
                hintText: Myapp9Localizations.of(context)!.inputCaptchaHint,
                image: _image,
                getCaptcha: () {
                  if (_phoneController.text.isEmpty || _phoneController.text.length < 11) {
                    Toast.show(Myapp9Localizations.of(context)!.inputPhoneInvalid);
                    return Future<bool>.value(false);
                  } else {
                    return _captcha();
                  }
                },
              ),
            ),
          ),
          Gaps.vGap24,
          MyButton(
            key: const Key('login'),
            onPressed: () {
              if (_phoneController.text.isEmpty || _phoneController.text.length < 11) {
                Toast.show(Myapp9Localizations.of(context)!.inputPhoneInvalid);
              } else if (_captchaVisable && (_captchaController.text.isEmpty || _captchaController.text.length < 4)) {
                Toast.show(Myapp9Localizations.of(context)!.inputCaptchaInvalid);
              } else {

                _showCallPhoneDialog(context, _phoneController.text, country!.dialCode);

              }
              // NavigatorUtils.push(context, LoginRouter.loginPhonePage);
              // _privacyAgreement ? _login() : Toast.show(Myapp9Localizations.of(context)!.inputPrivacy);
            },
            text: "Next",
          ),
          // Gaps.vGap12,
          Container(
            height: 40.0,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Myapp9Localizations.of(context)!.cantLogin,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Visibility(
                  visible: _loginPageInfo?.showContactPhone ?? true,
                  child: GestureDetector(
                    onTap: () => Utils.launchTelURL(_loginPageInfo?.contactPhone ?? ''),
                    child: Text(
                      _loginPageInfo?.contactPhone ?? '',
                      style: TextStyle(
                        color: Colours.app_main,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _loginPageInfo?.showContactPhone != false && _loginPageInfo?.showContactWa != false ? true : false,
                  child: Text(
                    Myapp9Localizations.of(context)!.or,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Visibility(
                  visible: _loginPageInfo?.showContactWa ?? true,
                  child: GestureDetector(
                    onTap: () => Utils.launchWhatsAppURL(_loginPageInfo?.contactWa ?? ''),
                    child: Text(
                      'WhatsApp',
                      style: TextStyle(
                        color: Colours.app_main,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }




}
