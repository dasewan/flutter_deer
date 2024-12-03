import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/verify_item_store_entity.g.dart';
import 'package:myapp9/models/g_verify_entity.dart';

import 'a_user_entity.dart';

@JsonSerializable()
class VerifyItemStoreEntity {
  VerifyItemStoreEntity();

  factory VerifyItemStoreEntity.fromJson(Map<String, dynamic> json) => $VerifyItemStoreEntityFromJson(json);

  Map<String, dynamic> toJson() => $VerifyItemStoreEntityToJson(this);

  bool? success;
	VerifyItemStoreData? data;
	String? message;
}

@JsonSerializable()
class VerifyItemStoreData {

	VerifyItemStoreData();

  factory VerifyItemStoreData.fromJson(Map<String, dynamic> json) => $VerifyItemStoreDataFromJson(json);

  Map<String, dynamic> toJson() => $VerifyItemStoreDataToJson(this);

  @JSONField(name: "g_verify")
  GVerifyEntity? gVerify;
  @JSONField(name: "a_user")
  AUserEntity? aUser;
  @JSONField(name: "next")
  String? next;
}

