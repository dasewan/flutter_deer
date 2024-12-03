import 'package:myapp9/generated/json/authorizations_store_entity.g.dart';
import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/models/a_user_entity.dart';

import 'n_user_profile_entity.dart';

@JsonSerializable()
class AuthorizationsStoreEntity {

	AuthorizationsStoreEntity();

	factory AuthorizationsStoreEntity.fromJson(Map<String, dynamic> json) => $AuthorizationsStoreEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuthorizationsStoreEntityToJson(this);

	AUserEntity? data;
	AuthorizationsStorePassport? passport;
	@JSONField(name: "device_id")
	int? deviceId;
  NUserProfileData? profile;
}

@JsonSerializable()
class AuthorizationsStorePassport {

	AuthorizationsStorePassport();

	factory AuthorizationsStorePassport.fromJson(Map<String, dynamic> json) => $AuthorizationsStorePassportFromJson(json);

	Map<String, dynamic> toJson() => $AuthorizationsStorePassportToJson(this);

	@JSONField(name: "token_type")
	String? tokenType;
	@JSONField(name: "expires_in")
	int? expiresIn;
	@JSONField(name: "access_token")
	String? accessToken;
	@JSONField(name: "refresh_token")
	String? refreshToken;
}
