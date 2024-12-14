import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/index_entity.dart';
import 'package:myapp9/mvp/mvps.dart';

abstract class LoginIMvpView implements IMvpView {
  void loginSuccess(AUserEntity userEntity);

  void verificationCodesSuccess(String verificationKey);

  void showCaptcha(String captchaKey, String captchaImageContent);
  void setLoginPageInfo(IndexDataLoginPageInfo info);
  @override
  void showCupertinoDialogSub({required String title, required String content});

// void verificationCodesSuccess(VerificationCodesEntity verificationCodesEntity) {}
//   UserProvider get provider;
}
