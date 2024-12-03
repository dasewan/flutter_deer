import 'dart:convert';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/verification_code_entity.g.dart';

@JsonSerializable()
class VerificationCodeEntity {
  bool? success;
  String? key;
  @JSONField(name: "expired_at")
  String? expiredAt;

  VerificationCodeEntity();

  factory VerificationCodeEntity.fromJson(Map<String, dynamic> json) => $VerificationCodeEntityFromJson(json);

  Map<String, dynamic> toJson() => $VerificationCodeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
