import 'dart:convert';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/captcha_entity.g.dart';

@JsonSerializable()
class CaptchaEntity {
  @JSONField(name: "captcha_key")
  String? captchaKey;
  @JSONField(name: "expired_at")
  String? expiredAt;
  @JSONField(name: "captcha_image_content")
  String? captchaImageContent;

  CaptchaEntity();

  factory CaptchaEntity.fromJson(Map<String, dynamic> json) => $CaptchaEntityFromJson(json);

  Map<String, dynamic> toJson() => $CaptchaEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
