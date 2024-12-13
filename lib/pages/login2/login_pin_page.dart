import 'dart:async';
import 'dart:convert';

import 'package:advance_country_picker/advance_country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:pinput/pinput.dart';
import 'package:sp_util/sp_util.dart';

import '../../models/index_entity.dart';
import '../../util/toast_utils.dart';
import '../../widgets/load_image.dart';
import '../privacy/router/privacy_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/locale_provider.dart';
import 'package:myapp9/pages/login2/router/login_router.dart';
import 'package:myapp9/util/theme_utils.dart';

/// design/1注册登录/index.html
class LoginPinPage extends StatefulWidget {
  const LoginPinPage({Key? key, required this.phone, required this.dialCode, required this.verificationKey}) : super(key: key);
  final String phone;
  final String dialCode;
  final String verificationKey;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPinPage>
    with ChangeNotifierMixin<LoginPinPage>, BasePageMixin<LoginPinPage, LoginPagePresenter>, AutomaticKeepAliveClientMixin<LoginPinPage>
    implements LoginIMvpView {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _vCodeController = TextEditingController();
  final TextEditingController _captchaController = TextEditingController();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  bool _codeClickable = false;
  String _verificationKey = '';
  String _captchaKey = '';
  bool _phoneCorrect = false;
  bool _otpLengthCorrect = false;
  IndexDataLoginPageInfo? _loginPageInfo;
  late LoginPagePresenter _loginPagePresenter;
  Image _image = Image.memory(Uint8List(0));
  Country? country;
  bool showError = false;
  final int _second = 59;
  late int _currentSecond = 59;
  StreamSubscription? _subscription;
  bool _clickable = false;



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
    setState(() {
      _verificationKey = widget.verificationKey;
    });
    _phoneController.text = SpUtil.getString(Constant.phone).nullSafe;

    setState(() {
      _currentSecond = _second;
      _clickable = false;
    });
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i).take(_second).listen((int i) {
      setState(() {
        _currentSecond = _second - i - 1;
        _clickable = _currentSecond < 1;
      });
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
    _verificationKey = verificationKey;
    setState(() {
      _currentSecond = _second;
      _clickable = false;
    });
    _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i).take(_second).listen((int i) {
      setState(() {
        _currentSecond = _second - i - 1;
        _clickable = _currentSecond < 1;
      });
    });
  }

  ///登录成功
  @override
  void loginSuccess(AUserEntity userEntity) {
    SpUtil.putString(Constant.phone, _phoneController.text);
    // showToast("登录成功");
    NavigatorUtils.push(context, Routes.home, clearStack: true);
  }

  @override
  void showCaptcha(String captchaKey, String captchaImageContent) {
    _captchaKey = captchaKey;
    final List<int> imageBytes =
    base64Decode(captchaImageContent.split(",").last);
    final Uint8List uint8List = Uint8List.fromList(imageBytes);
    _image = Image.memory(uint8List);
    setState(() {
      _image = _image;
    });
    _showCaptchaDialog(
        context, _image, _phoneController.text, _captchaKey);
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
    return _loginPagePresenter.verificationCodes(phone, false, captchaKey: _captchaKey, captchaCode: captchaCode);
  }

  ///发送图片验证码
  Future<bool> _captcha() async {
    return await _loginPagePresenter.captchas(widget.phone!, false);
  }

  ///登录
  void _login(String otp, String verificationKey) {
    String phone = SpUtil.getString(Constant.phone)!;
    _loginPagePresenter.login(phone, verificationKey, otp, false);
  }
  void _dialogSelect() {

    NavigatorUtils.goBack(context);
  }

  void _showCaptchaDialog(
      BuildContext context, Image image, String phone, String captchaKey) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'To continue, type the characters you see in the picture.',
                          style: Theme.of(context).textTheme.titleSmall),
                      Gaps.vGap4,
                      Text(
                          'Sorry, we just need to make sure you\'re not a  robot.',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  )),
              Gaps.vGap12,
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    image,
                    Gaps.vGap4,
                    Row(
                      children: [
                        const Expanded(child: Gaps.hGap16),
                        GestureDetector(
                          onTap: () {
                            _captchaController.clear();
                            NavigatorUtils.goBack(context);
                            _captcha();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.refresh,
                                color: Colours.app_main,
                                size: 18,
                              ),
                              Text('Try different image',
                                  style: TextStyle(color: Colours.app_main)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gaps.vGap4,
                    Row(
                      children: [
                        SizedBox(
                          width: 270,
                          child: TextField(
                            focusNode: _nodeText3,
                            maxLength: 6,
                            autofocus: true,
                            controller: _captchaController,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(
                              fontSize: 18.0, // 设置输入文本的字体大小
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Type the word above',
                              counterText: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.vGap24,
                    MyButton(
                      key: const Key('login'),
                      onPressed: () async {
                        if (_captchaController.text.isEmpty ||
                            _captchaController.text.length != 5) {
                          Toast.show('请输入五位字符');
                          return;
                        }
                        final String captchaCode = _captchaController.text;
                        _captchaController.clear();
                        NavigatorUtils.goBack(context);
                        await _loginPagePresenter.verificationCodes(
                            phone, false,
                            captchaKey: _captchaKey, captchaCode: captchaCode);
                      },
                      text: 'Submit',
                    ),
                    Gaps.vGap10,
                    GestureDetector(
                      onTap: () {
                        _captchaController.clear();
                        NavigatorUtils.goBack(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Cancel',
                              style: TextStyle(color: Colours.app_main)),
                        ],
                      ),
                    ),
                    Gaps.vGap4,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gaps.vGap8,
          Text(
             'Verification',
            style: const TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.w900, fontFamily: 'RobotoThin'),
          ),
          Gaps.vGap24,
          Text(
            'Enter the code sent to the number: ',
            style: Theme.of(context).textTheme.titleSmall!.merge(TextStyle( fontSize: 14.0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '15921185025.',
                style: Theme.of(context).textTheme.titleSmall!.merge(TextStyle( fontSize: 14.0)),
              ),
              GestureDetector(
                onTap: () => NavigatorUtils.goBack(context),
                child: Text(
                  ' Wrong number?',
                  style: Theme.of(context).textTheme.titleSmall!.merge(const TextStyle( fontSize: 14.0,decoration: TextDecoration.underline,color: Colours.app_main)),
                ),
              ),
            ],
          ),
          Gaps.vGap24,
          Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Directionality(
                    // Specify direction if desired
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      controller: pinController,
                      focusNode: focusNode,
                      defaultPinTheme: defaultPinTheme,
                      validator: (value) {
                        _login(value?? '', _verificationKey);
                      },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 44),
                Text(
                  'Didn’t receive code?',
                  style: Theme.of(context).textTheme.titleSmall!.merge(const TextStyle( fontSize: 15.0, fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () async {
                    if(!_clickable){
                      Toast.show('$_currentSecond秒后才能重新发送');
                      return;
                    }
                    pinController.clear();
                    FocusScope.of(context).requestFocus(focusNode);
                    await _verificationCodes();
                  },
                  child: Text(
                    _clickable ? 'Resend' : 'You may request a new code in 0:$_currentSecond s',
                    style: Theme.of(context).textTheme.titleSmall!.merge(const TextStyle( fontSize: 15.0,decoration: TextDecoration.underline,color: Colours.app_main)),
                  ),
                ),
              ],
            ),
          ),
          Gaps.vGap24,
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
                      style: Theme.of(context).textTheme.titleSmall!.merge(const TextStyle( fontSize: 15.0,decoration: TextDecoration.underline,color: Colours.app_main)),
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
                      style: Theme.of(context).textTheme.titleSmall!.merge(const TextStyle( fontSize: 15.0,decoration: TextDecoration.underline,color: Colours.app_main)),
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
