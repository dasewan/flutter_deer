import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/generated/verification_code_entity.dart';

VerificationCodeEntity $VerificationCodeEntityFromJson(Map<String, dynamic> json) {
  final VerificationCodeEntity verificationCodeEntity = VerificationCodeEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    verificationCodeEntity.success = success;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    verificationCodeEntity.key = key;
  }
  final String? expiredAt = jsonConvert.convert<String>(json['expired_at']);
  if (expiredAt != null) {
    verificationCodeEntity.expiredAt = expiredAt;
  }
  return verificationCodeEntity;
}

Map<String, dynamic> $VerificationCodeEntityToJson(VerificationCodeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['key'] = entity.key;
  data['expired_at'] = entity.expiredAt;
  return data;
}

extension VerificationCodeEntityExtension on VerificationCodeEntity {
  VerificationCodeEntity copyWith({
    bool? success,
    String? key,
    String? expiredAt,
  }) {
    return VerificationCodeEntity()
      ..success = success ?? this.success
      ..key = key ?? this.key
      ..expiredAt = expiredAt ?? this.expiredAt;
  }
}