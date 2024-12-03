import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/index_first_entity.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';

IndexFirstEntity $IndexFirstEntityFromJson(Map<dynamic, dynamic> json) {
  final IndexFirstEntity indexFirstEntity = IndexFirstEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    indexFirstEntity.success = success;
  }
  final IndexFirstData? data = jsonConvert.convert<IndexFirstData>(json['data']);
  if (data != null) {
    indexFirstEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    indexFirstEntity.message = message;
  }
  return indexFirstEntity;
}

Map<String, dynamic> $IndexFirstEntityToJson(IndexFirstEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension IndexFirstEntityExtension on IndexFirstEntity {
  IndexFirstEntity copyWith({
    bool? success,
    IndexFirstData? data,
    String? message,
  }) {
    return IndexFirstEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

IndexFirstData $IndexFirstDataFromJson(Map<String, dynamic> json) {
  final IndexFirstData indexFirstData = IndexFirstData();
  final String? maxTime = jsonConvert.convert<String>(json['max_time']);
  if (maxTime != null) {
    indexFirstData.maxTime = maxTime;
  }
  final String? bProductsNewestUpdatedAt = jsonConvert.convert<String>(json['b_products_newest_updated_at']);
  if (bProductsNewestUpdatedAt != null) {
    indexFirstData.bProductsNewestUpdatedAt = bProductsNewestUpdatedAt;
  }
  final AUserEntity? aUser = jsonConvert.convert<AUserEntity>(json['a_user']);
  if (aUser != null) {
    indexFirstData.aUser = aUser;
  }
  final List<BProductEntity>? bProducts = (json['b_products'] as List<dynamic>?)?.map((e) => jsonConvert.convert<BProductEntity>(e) as BProductEntity).toList();
  if (bProducts != null) {
    indexFirstData.bProducts = bProducts;
  }
  final GVerifyEntity? gVerify = jsonConvert.convert<GVerifyEntity>(json['g_verify']);
  if (gVerify != null) {
    indexFirstData.gVerify = gVerify;
  }
  final List<QVerifyItemEntity>? qVerifyItems =
      (json['q_verify_items'] as List<dynamic>?)?.map((e) => jsonConvert.convert<QVerifyItemEntity>(e) as QVerifyItemEntity).toList();
  if (qVerifyItems != null) {
    indexFirstData.qVerifyItems = qVerifyItems;
  }
  return indexFirstData;
}

Map<String, dynamic> $IndexFirstDataToJson(IndexFirstData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['max_time'] = entity.maxTime;
  data['b_products_newest_updated_at'] = entity.bProductsNewestUpdatedAt;
  data['a_user'] = entity.aUser?.toJson();
  data['b_products'] = entity.bProducts?.map((v) => v.toJson()).toList();
  data['g_verify'] = entity.gVerify?.toJson();
  data['q_verify_items'] = entity.qVerifyItems?.map((v) => v.toJson()).toList();
  return data;
}

extension IndexFirstDataExtension on IndexFirstData {
  IndexFirstData copyWith({
    String? maxTime,
    String? bProductsNewestUpdatedAt,
    AUserEntity? aUser,
    List<BProductEntity>? bProducts,
    GVerifyEntity? gVerify,
    List<QVerifyItemEntity>? qVerifyItems,
  }) {
    return IndexFirstData()
      ..maxTime = maxTime ?? this.maxTime
      ..bProductsNewestUpdatedAt = bProductsNewestUpdatedAt ?? this.bProductsNewestUpdatedAt
      ..aUser = aUser ?? this.aUser
      ..bProducts = bProducts ?? this.bProducts
      ..gVerify = gVerify ?? this.gVerify
      ..qVerifyItems = qVerifyItems ?? this.qVerifyItems;
  }
}