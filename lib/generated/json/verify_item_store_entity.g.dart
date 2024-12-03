import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/verify_item_store_entity.dart';

import '../../models/a_user_entity.dart';

VerifyItemStoreEntity $VerifyItemStoreEntityFromJson(Map<String, dynamic> json) {
  final VerifyItemStoreEntity verifyItemStoreEntity = VerifyItemStoreEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    verifyItemStoreEntity.success = success;
  }
  final VerifyItemStoreData? data = jsonConvert.convert<VerifyItemStoreData>(json['data']);
  if (data != null) {
    verifyItemStoreEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    verifyItemStoreEntity.message = message;
  }
  return verifyItemStoreEntity;
}

Map<String, dynamic> $VerifyItemStoreEntityToJson(VerifyItemStoreEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension VerifyItemStoreEntityExtension on VerifyItemStoreEntity {
  VerifyItemStoreEntity copyWith({
    bool? success,
    VerifyItemStoreData? data,
    String? message,
  }) {
    return VerifyItemStoreEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

VerifyItemStoreData $VerifyItemStoreDataFromJson(Map<String, dynamic> json) {
  final VerifyItemStoreData verifyItemStoreData = VerifyItemStoreData();
  final GVerifyEntity? gVerify = jsonConvert.convert<GVerifyEntity>(json['g_verify']);
  if (gVerify != null) {
    verifyItemStoreData.gVerify = gVerify;
  }
  final AUserEntity? aUser = jsonConvert.convert<AUserEntity>(json['a_user']);
  if (aUser != null) {
    verifyItemStoreData.aUser = aUser;
  }
  final String? next = jsonConvert.convert<String>(json['next']);
  if (next != null) {
    verifyItemStoreData.next = next;
  }
  return verifyItemStoreData;
}

Map<String, dynamic> $VerifyItemStoreDataToJson(VerifyItemStoreData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['g_verify'] = entity.gVerify?.toJson();
  data['a_user'] = entity.aUser?.toJson();
  data['next'] = entity.next;
  return data;
}

extension VerifyItemStoreDataExtension on VerifyItemStoreData {
  VerifyItemStoreData copyWith({
    GVerifyEntity? gVerify,
    AUserEntity? aUser,
    String? next,
  }) {
    return VerifyItemStoreData()
      ..gVerify = gVerify ?? this.gVerify
      ..aUser = aUser ?? this.aUser
      ..next = next ?? this.next;
  }
}