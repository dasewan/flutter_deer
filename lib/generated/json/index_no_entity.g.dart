import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/index_no_entity.dart';

IndexNoEntity $IndexNoEntityFromJson(Map<String, dynamic> json) {
  final IndexNoEntity indexNoEntity = IndexNoEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    indexNoEntity.success = success;
  }
  final IndexNoData? data = jsonConvert.convert<IndexNoData>(json['data']);
  if (data != null) {
    indexNoEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    indexNoEntity.message = message;
  }
  return indexNoEntity;
}

Map<String, dynamic> $IndexNoEntityToJson(IndexNoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension IndexNoEntityExtension on IndexNoEntity {
  IndexNoEntity copyWith({
    bool? success,
    IndexNoData? data,
    String? message,
  }) {
    return IndexNoEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

IndexNoData $IndexNoDataFromJson(Map<String, dynamic> json) {
  final IndexNoData indexNoData = IndexNoData();
  final int? hIndexNo = jsonConvert.convert<int>(json['h_index_no']);
  if (hIndexNo != null) {
    indexNoData.hIndexNo = hIndexNo;
  }
  final int? iIndexAction = jsonConvert.convert<int>(json['i_index_action']);
  if (iIndexAction != null) {
    indexNoData.iIndexAction = iIndexAction;
  }
  final int? aeMessage = jsonConvert.convert<int>(json['ae_message']);
  if (aeMessage != null) {
    indexNoData.aeMessage = aeMessage;
  }
  return indexNoData;
}

Map<String, dynamic> $IndexNoDataToJson(IndexNoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['h_index_no'] = entity.hIndexNo;
  data['i_index_action'] = entity.iIndexAction;
  data['ae_message'] = entity.aeMessage;
  return data;
}

extension IndexNoDataExtension on IndexNoData {
  IndexNoData copyWith({
    int? hIndexNo,
    int? iIndexAction,
    int? aeMessage,
  }) {
    return IndexNoData()
      ..hIndexNo = hIndexNo ?? this.hIndexNo
      ..iIndexAction = iIndexAction ?? this.iIndexAction
      ..aeMessage = aeMessage ?? this.aeMessage;
  }
}