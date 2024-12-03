import 'package:myapp9/generated/captcha_entity.dart';
import 'package:myapp9/generated/json/base/json_convert_content.dart';

CaptchaEntity $CaptchaEntityFromJson(Map<String, dynamic> json) {
  final CaptchaEntity captchaEntity = CaptchaEntity();
  final String? captchaKey = jsonConvert.convert<String>(json['captcha_key']);
  if (captchaKey != null) {
    captchaEntity.captchaKey = captchaKey;
  }
  final String? expiredAt = jsonConvert.convert<String>(json['expired_at']);
  if (expiredAt != null) {
    captchaEntity.expiredAt = expiredAt;
  }
  final String? captchaImageContent = jsonConvert.convert<String>(json['captcha_image_content']);
  if (captchaImageContent != null) {
    captchaEntity.captchaImageContent = captchaImageContent;
  }
  return captchaEntity;
}

Map<String, dynamic> $CaptchaEntityToJson(CaptchaEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['captcha_key'] = entity.captchaKey;
  data['expired_at'] = entity.expiredAt;
  data['captcha_image_content'] = entity.captchaImageContent;
  return data;
}

extension CaptchaEntityExtension on CaptchaEntity {
  CaptchaEntity copyWith({
    String? captchaKey,
    String? expiredAt,
    String? captchaImageContent,
  }) {
    return CaptchaEntity()
      ..captchaKey = captchaKey ?? this.captchaKey
      ..expiredAt = expiredAt ?? this.expiredAt
      ..captchaImageContent = captchaImageContent ?? this.captchaImageContent;
  }
}