import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/credit_history_entity.dart';

CreditHistoryEntity $CreditHistoryEntityFromJson(Map<String, dynamic> json) {
  final CreditHistoryEntity creditHistoryEntity = CreditHistoryEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    creditHistoryEntity.success = success;
  }
  final String? errorMessage = jsonConvert.convert<String>(
      json['errorMessage']);
  if (errorMessage != null) {
    creditHistoryEntity.errorMessage = errorMessage;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    creditHistoryEntity.message = message;
  }
  final List<CreditHistoryData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CreditHistoryData>(e) as CreditHistoryData)
      .toList();
  if (data != null) {
    creditHistoryEntity.data = data;
  }
  final List<dynamic>? other = (json['other'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (other != null) {
    creditHistoryEntity.other = other;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    creditHistoryEntity.total = total;
  }
  final int? currentPage = jsonConvert.convert<int>(json['currentPage']);
  if (currentPage != null) {
    creditHistoryEntity.currentPage = currentPage;
  }
  final int? perPage = jsonConvert.convert<int>(json['perPage']);
  if (perPage != null) {
    creditHistoryEntity.perPage = perPage;
  }
  final bool? hasMorePages = jsonConvert.convert<bool>(json['hasMorePages']);
  if (hasMorePages != null) {
    creditHistoryEntity.hasMorePages = hasMorePages;
  }
  return creditHistoryEntity;
}

Map<String, dynamic> $CreditHistoryEntityToJson(CreditHistoryEntity entity) {
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

extension CreditHistoryEntityExtension on CreditHistoryEntity {
  CreditHistoryEntity copyWith({
    bool? success,
    String? errorMessage,
    String? message,
    List<CreditHistoryData>? data,
    List<dynamic>? other,
    int? total,
    int? currentPage,
    int? perPage,
    bool? hasMorePages,
  }) {
    return CreditHistoryEntity()
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

CreditHistoryData $CreditHistoryDataFromJson(Map<String, dynamic> json) {
  final CreditHistoryData creditHistoryData = CreditHistoryData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    creditHistoryData.id = id;
  }
  final int? bType = jsonConvert.convert<int>(json['b_type']);
  if (bType != null) {
    creditHistoryData.bType = bType;
  }
  final int? dAmount = jsonConvert.convert<int>(json['d_amount']);
  if (dAmount != null) {
    creditHistoryData.dAmount = dAmount;
  }
  final int? jCreditScore = jsonConvert.convert<int>(json['j_credit_score']);
  if (jCreditScore != null) {
    creditHistoryData.jCreditScore = jCreditScore;
  }
  final int? kOverdueDays = jsonConvert.convert<int>(json['k_overdue_days']);
  if (kOverdueDays != null) {
    creditHistoryData.kOverdueDays = kOverdueDays;
  }
  final int? cBeforeCreditAmount = jsonConvert.convert<int>(
      json['c_before_credit_amount']);
  if (cBeforeCreditAmount != null) {
    creditHistoryData.cBeforeCreditAmount = cBeforeCreditAmount;
  }
  final int? iBeforeCreditScore = jsonConvert.convert<int>(
      json['i_before_credit_score']);
  if (iBeforeCreditScore != null) {
    creditHistoryData.iBeforeCreditScore = iBeforeCreditScore;
  }
  final int? lAfterCreditAmount = jsonConvert.convert<int>(
      json['l_after_credit_amount']);
  if (lAfterCreditAmount != null) {
    creditHistoryData.lAfterCreditAmount = lAfterCreditAmount;
  }
  final int? mAfterCreditScore = jsonConvert.convert<int>(
      json['m_after_credit_score']);
  if (mAfterCreditScore != null) {
    creditHistoryData.mAfterCreditScore = mAfterCreditScore;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    creditHistoryData.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    creditHistoryData.updatedAt = updatedAt;
  }
  return creditHistoryData;
}

Map<String, dynamic> $CreditHistoryDataToJson(CreditHistoryData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['b_type'] = entity.bType;
  data['d_amount'] = entity.dAmount;
  data['j_credit_score'] = entity.jCreditScore;
  data['k_overdue_days'] = entity.kOverdueDays;
  data['c_before_credit_amount'] = entity.cBeforeCreditAmount;
  data['i_before_credit_score'] = entity.iBeforeCreditScore;
  data['l_after_credit_amount'] = entity.lAfterCreditAmount;
  data['m_after_credit_score'] = entity.mAfterCreditScore;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension CreditHistoryDataExtension on CreditHistoryData {
  CreditHistoryData copyWith({
    int? id,
    int? bType,
    int? dAmount,
    int? jCreditScore,
    int? kOverdueDays,
    int? cBeforeCreditAmount,
    int? iBeforeCreditScore,
    int? lAfterCreditAmount,
    int? mAfterCreditScore,
    String? createdAt,
    String? updatedAt,
  }) {
    return CreditHistoryData()
      ..id = id ?? this.id
      ..bType = bType ?? this.bType
      ..dAmount = dAmount ?? this.dAmount
      ..jCreditScore = jCreditScore ?? this.jCreditScore
      ..kOverdueDays = kOverdueDays ?? this.kOverdueDays
      ..cBeforeCreditAmount = cBeforeCreditAmount ?? this.cBeforeCreditAmount
      ..iBeforeCreditScore = iBeforeCreditScore ?? this.iBeforeCreditScore
      ..lAfterCreditAmount = lAfterCreditAmount ?? this.lAfterCreditAmount
      ..mAfterCreditScore = mAfterCreditScore ?? this.mAfterCreditScore
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}