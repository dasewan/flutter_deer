import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/d_borrow_sign_entity.dart';
import 'package:myapp9/models/sync_entity.dart';


DBorrowSignEntity $DBorrowSignEntityFromJson(Map<dynamic, dynamic> json) {
  final DBorrowSignEntity dBorrowSignEntity = DBorrowSignEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    dBorrowSignEntity.success = success;
  }
  final DBorrowSignData? data = jsonConvert.convert<DBorrowSignData>(json['data']);
  if (data != null) {
    dBorrowSignEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    dBorrowSignEntity.message = message;
  }
  return dBorrowSignEntity;
}

Map<String, dynamic> $DBorrowSignEntityToJson(DBorrowSignEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension DBorrowSignEntityExtension on DBorrowSignEntity {
  DBorrowSignEntity copyWith({
    bool? success,
    DBorrowSignData? data,
    String? message,
  }) {
    return DBorrowSignEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

DBorrowSignData $DBorrowSignDataFromJson(Map<dynamic, dynamic> json) {
  final DBorrowSignData dBorrowSignData = DBorrowSignData();
  final List<DBorrowSignDataPreComputeItem>? preComputeList =
      (json['pre_compute_list'] as List<dynamic>?)?.map((e) => jsonConvert.convert<DBorrowSignDataPreComputeItem>(e) as DBorrowSignDataPreComputeItem).toList();
  if (preComputeList != null) {
    dBorrowSignData.preComputeList = preComputeList;
  }
  final SyncEntity? syncInfo = jsonConvert.convert<SyncEntity>(json['sync_info']);
  if (syncInfo != null) {
    dBorrowSignData.syncInfo = syncInfo;
  }
  final String? lastFetchTime = jsonConvert.convert<String>(json['last_fetch_time']);
  if (lastFetchTime != null) {
    dBorrowSignData.lastFetchTime = lastFetchTime;
  }
  final String? confirm = jsonConvert.convert<String>(json['confirm']);
  if (confirm != null) {
    dBorrowSignData.confirm = confirm;
  }
  return dBorrowSignData;
}

Map<String, dynamic> $DBorrowSignDataToJson(DBorrowSignData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pre_compute_list'] = entity.preComputeList?.map((v) => v.toJson()).toList();
  data['sync_info'] = entity.syncInfo?.toJson();
  data['last_fetch_time'] = entity.lastFetchTime;
  data['confirm'] = entity.confirm;
  return data;
}

extension DBorrowSignDataExtension on DBorrowSignData {
  DBorrowSignData copyWith({
    List<DBorrowSignDataPreComputeItem>? preComputeList,
    SyncEntity? syncInfo,
    String? lastFetchTime,
    String? confirm,
  }) {
    return DBorrowSignData()
      ..preComputeList = preComputeList ?? this.preComputeList
      ..syncInfo = syncInfo ?? this.syncInfo
      ..lastFetchTime = lastFetchTime ?? this.lastFetchTime
      ..confirm = confirm ?? this.confirm;
  }
}

DBorrowSignDataPreComputeItem $DBorrowSignDataPreComputeItemFromJson(Map<dynamic, dynamic> json) {
  final DBorrowSignDataPreComputeItem dBorrowSignDataPreComputeItem = DBorrowSignDataPreComputeItem();
  final String? field = jsonConvert.convert<String>(json['field']);
  if (field != null) {
    dBorrowSignDataPreComputeItem.field = field;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    dBorrowSignDataPreComputeItem.sort = sort;
  }
  final String? text = jsonConvert.convert<String>(json['text']);
  if (text != null) {
    dBorrowSignDataPreComputeItem.text = text;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    dBorrowSignDataPreComputeItem.value = value;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    dBorrowSignDataPreComputeItem.remark = remark;
  }
  return dBorrowSignDataPreComputeItem;
}

Map<String, dynamic> $DBorrowSignDataPreComputeItemToJson(DBorrowSignDataPreComputeItem entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['field'] = entity.field;
  data['sort'] = entity.sort;
  data['text'] = entity.text;
  data['value'] = entity.value;
  data['remark'] = entity.remark;
  return data;
}

extension DBorrowSignDataPreComputeItemExtension on DBorrowSignDataPreComputeItem {
  DBorrowSignDataPreComputeItem copyWith({
    String? field,
    int? sort,
    String? text,
    String? value,
    String? remark,
  }) {
    return DBorrowSignDataPreComputeItem()
      ..field = field ?? this.field
      ..sort = sort ?? this.sort
      ..text = text ?? this.text
      ..value = value ?? this.value
      ..remark = remark ?? this.remark;
  }
}