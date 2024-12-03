import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/authorizations_store_entity.dart';
import 'package:myapp9/models/n_user_profile_entity.dart';

AuthorizationsStoreEntity $AuthorizationsStoreEntityFromJson(Map<String, dynamic> json) {
  final AuthorizationsStoreEntity authorizationsStoreEntity = AuthorizationsStoreEntity();
  final AUserEntity? data = jsonConvert.convert<AUserEntity>(json['data']);
  if (data != null) {
    authorizationsStoreEntity.data = data;
  }
  final AuthorizationsStorePassport? passport = jsonConvert.convert<AuthorizationsStorePassport>(json['passport']);
  if (passport != null) {
    authorizationsStoreEntity.passport = passport;
  }
  final int? deviceId = jsonConvert.convert<int>(json['device_id']);
  if (deviceId != null) {
    authorizationsStoreEntity.deviceId = deviceId;
  }
  final NUserProfileData? profile = jsonConvert.convert<NUserProfileData>(json['profile']);
  if (profile != null) {
    authorizationsStoreEntity.profile = profile;
  }
  return authorizationsStoreEntity;
}

Map<String, dynamic> $AuthorizationsStoreEntityToJson(AuthorizationsStoreEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['passport'] = entity.passport?.toJson();
  data['device_id'] = entity.deviceId;
  data['profile'] = entity.profile?.toJson();
  return data;
}

extension AuthorizationsStoreEntityExtension on AuthorizationsStoreEntity {
  AuthorizationsStoreEntity copyWith({
    AUserEntity? data,
    AuthorizationsStorePassport? passport,
    int? deviceId,
    NUserProfileData? profile,
  }) {
    return AuthorizationsStoreEntity()
      ..data = data ?? this.data
      ..passport = passport ?? this.passport
      ..deviceId = deviceId ?? this.deviceId
      ..profile = profile ?? this.profile;
  }
}

AuthorizationsStorePassport $AuthorizationsStorePassportFromJson(Map<String, dynamic> json) {
  final AuthorizationsStorePassport authorizationsStorePassport = AuthorizationsStorePassport();
  final String? tokenType = jsonConvert.convert<String>(json['token_type']);
  if (tokenType != null) {
    authorizationsStorePassport.tokenType = tokenType;
  }
  final int? expiresIn = jsonConvert.convert<int>(json['expires_in']);
  if (expiresIn != null) {
    authorizationsStorePassport.expiresIn = expiresIn;
  }
  final String? accessToken = jsonConvert.convert<String>(json['access_token']);
  if (accessToken != null) {
    authorizationsStorePassport.accessToken = accessToken;
  }
  final String? refreshToken = jsonConvert.convert<String>(json['refresh_token']);
  if (refreshToken != null) {
    authorizationsStorePassport.refreshToken = refreshToken;
  }
  return authorizationsStorePassport;
}

Map<String, dynamic> $AuthorizationsStorePassportToJson(AuthorizationsStorePassport entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['token_type'] = entity.tokenType;
  data['expires_in'] = entity.expiresIn;
  data['access_token'] = entity.accessToken;
  data['refresh_token'] = entity.refreshToken;
  return data;
}

extension AuthorizationsStorePassportExtension on AuthorizationsStorePassport {
  AuthorizationsStorePassport copyWith({
    String? tokenType,
    int? expiresIn,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthorizationsStorePassport()
      ..tokenType = tokenType ?? this.tokenType
      ..expiresIn = expiresIn ?? this.expiresIn
      ..accessToken = accessToken ?? this.accessToken
      ..refreshToken = refreshToken ?? this.refreshToken;
  }
}