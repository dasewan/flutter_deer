import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/repay_log_entity.dart';

RepayLogEntity $RepayLogEntityFromJson(Map<String, dynamic> json) {
  final RepayLogEntity repayLogEntity = RepayLogEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    repayLogEntity.success = success;
  }
  final String? errorMessage = jsonConvert.convert<String>(
      json['errorMessage']);
  if (errorMessage != null) {
    repayLogEntity.errorMessage = errorMessage;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    repayLogEntity.message = message;
  }
  final List<RepayLogData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<RepayLogData>(e) as RepayLogData).toList();
  if (data != null) {
    repayLogEntity.data = data;
  }
  final List<dynamic>? other = (json['other'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (other != null) {
    repayLogEntity.other = other;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    repayLogEntity.total = total;
  }
  final int? currentPage = jsonConvert.convert<int>(json['currentPage']);
  if (currentPage != null) {
    repayLogEntity.currentPage = currentPage;
  }
  final int? perPage = jsonConvert.convert<int>(json['perPage']);
  if (perPage != null) {
    repayLogEntity.perPage = perPage;
  }
  final bool? hasMorePages = jsonConvert.convert<bool>(json['hasMorePages']);
  if (hasMorePages != null) {
    repayLogEntity.hasMorePages = hasMorePages;
  }
  return repayLogEntity;
}

Map<String, dynamic> $RepayLogEntityToJson(RepayLogEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['errorMessage'] = entity.errorMessage;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['other'] = entity.other;
  data['total'] = entity.total;
  data['currentPage'] = entity.currentPage;
  data['perPage'] = entity.perPage;
  data['hasMorePages'] = entity.hasMorePages;
  return data;
}

extension RepayLogEntityExtension on RepayLogEntity {
  RepayLogEntity copyWith({
    bool? success,
    String? errorMessage,
    String? message,
    List<RepayLogData>? data,
    List<dynamic>? other,
    int? total,
    int? currentPage,
    int? perPage,
    bool? hasMorePages,
  }) {
    return RepayLogEntity()
      ..success = success ?? this.success
      ..errorMessage = errorMessage ?? this.errorMessage
      ..message = message ?? this.message
      ..data = data ?? this.data
      ..other = other ?? this.other
      ..total = total ?? this.total
      ..currentPage = currentPage ?? this.currentPage
      ..perPage = perPage ?? this.perPage
      ..hasMorePages = hasMorePages ?? this.hasMorePages;
  }
}

RepayLogData $RepayLogDataFromJson(Map<String, dynamic> json) {
  final RepayLogData repayLogData = RepayLogData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    repayLogData.id = id;
  }
  final int? jStatus = jsonConvert.convert<int>(json['j_status']);
  if (jStatus != null) {
    repayLogData.jStatus = jStatus;
  }
  final String? sReference = jsonConvert.convert<String>(json['s_reference']);
  if (sReference != null) {
    repayLogData.sReference = sReference;
  }
  final int? uAmount = jsonConvert.convert<int>(json['u_amount']);
  if (uAmount != null) {
    repayLogData.uAmount = uAmount;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    repayLogData.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    repayLogData.updatedAt = updatedAt;
  }
  return repayLogData;
}

Map<String, dynamic> $RepayLogDataToJson(RepayLogData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['j_status'] = entity.jStatus;
  data['s_reference'] = entity.sReference;
  data['u_amount'] = entity.uAmount;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension RepayLogDataExtension on RepayLogData {
  RepayLogData copyWith({
    int? id,
    int? jStatus,
    String? sReference,
    int? uAmount,
    String? createdAt,
    String? updatedAt,
  }) {
    return RepayLogData()
      ..id = id ?? this.id
      ..jStatus = jStatus ?? this.jStatus
      ..sReference = sReference ?? this.sReference
      ..uAmount = uAmount ?? this.uAmount
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}