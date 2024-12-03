import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/g_verifies_show_entity.dart';
import 'package:myapp9/models/g_verify_entity.dart';

import 'package:myapp9/models/q_verify_item_entity.dart';


GVerifiesShowEntity $GVerifiesShowEntityFromJson(Map<String, dynamic> json) {
  final GVerifiesShowEntity gVerifiesShowEntity = GVerifiesShowEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    gVerifiesShowEntity.success = success;
  }
  final GVerifiesShowData? data = jsonConvert.convert<GVerifiesShowData>(json['data']);
  if (data != null) {
    gVerifiesShowEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    gVerifiesShowEntity.message = message;
  }
  return gVerifiesShowEntity;
}

Map<String, dynamic> $GVerifiesShowEntityToJson(GVerifiesShowEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension GVerifiesShowEntityExtension on GVerifiesShowEntity {
  GVerifiesShowEntity copyWith({
    bool? success,
    GVerifiesShowData? data,
    String? message,
  }) {
    return GVerifiesShowEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

GVerifiesShowData $GVerifiesShowDataFromJson(Map<String, dynamic> json) {
  final GVerifiesShowData gVerifiesShowData = GVerifiesShowData();
  final GVerifyEntity? gVerify = jsonConvert.convert<GVerifyEntity>(json['g_verify']);
  if (gVerify != null) {
    gVerifiesShowData.gVerify = gVerify;
  }
  final List<QVerifyItemEntity>? qVerifyItems =
      (json['q_verify_items'] as List<dynamic>?)?.map((e) => jsonConvert.convert<QVerifyItemEntity>(e) as QVerifyItemEntity).toList();
  if (qVerifyItems != null) {
    gVerifiesShowData.qVerifyItems = qVerifyItems;
  }
  final String? lastFetchTime = jsonConvert.convert<String>(json['last_fetch_time']);
  if (lastFetchTime != null) {
    gVerifiesShowData.lastFetchTime = lastFetchTime;
  }
  final int? indexAction = jsonConvert.convert<int>(json['index_action']);
  if (indexAction != null) {
    gVerifiesShowData.indexAction = indexAction;
  }
  return gVerifiesShowData;
}

Map<String, dynamic> $GVerifiesShowDataToJson(GVerifiesShowData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['g_verify'] = entity.gVerify?.toJson();
  data['q_verify_items'] = entity.qVerifyItems?.map((v) => v.toJson()).toList();
  data['last_fetch_time'] = entity.lastFetchTime;
  data['index_action'] = entity.indexAction;
  return data;
}

extension GVerifiesShowDataExtension on GVerifiesShowData {
  GVerifiesShowData copyWith({
    GVerifyEntity? gVerify,
    List<QVerifyItemEntity>? qVerifyItems,
    String? lastFetchTime,
    int? indexAction,
  }) {
    return GVerifiesShowData()
      ..gVerify = gVerify ?? this.gVerify
      ..qVerifyItems = qVerifyItems ?? this.qVerifyItems
      ..lastFetchTime = lastFetchTime ?? this.lastFetchTime
      ..indexAction = indexAction ?? this.indexAction;
  }
}