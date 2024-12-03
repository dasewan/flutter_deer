import 'package:myapp9/generated/center_entity.dart';
import 'package:myapp9/generated/json/base/json_convert_content.dart';

CenterEntity $CenterEntityFromJson(Map<String, dynamic> json) {
  final CenterEntity centerEntity = CenterEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    centerEntity.success = success;
  }
  final CenterData? data = jsonConvert.convert<CenterData>(json['data']);
  if (data != null) {
    centerEntity.data = data;
  }
  final List<dynamic>? other = (json['other'] as List<dynamic>?)?.map((e) => e).toList();
  if (other != null) {
    centerEntity.other = other;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    centerEntity.message = message;
  }
  return centerEntity;
}

Map<String, dynamic> $CenterEntityToJson(CenterEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['other'] = entity.other;
  data['message'] = entity.message;
  return data;
}

extension CenterEntityExtension on CenterEntity {
  CenterEntity copyWith({
    bool? success,
    CenterData? data,
    List<dynamic>? other,
    String? message,
  }) {
    return CenterEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..other = other ?? this.other
      ..message = message ?? this.message;
  }
}

CenterData $CenterDataFromJson(Map<dynamic, dynamic> json) {
  final CenterData centerData = CenterData();
  final String? bName = jsonConvert.convert<String>(json['b_name']);
  if (bName != null) {
    centerData.bName = bName;
  }
  final String? aPhone = jsonConvert.convert<String>(json['a_phone']);
  if (aPhone != null) {
    centerData.aPhone = aPhone;
  }
  final int? aEMessage = jsonConvert.convert<int>(json['a_e_message']);
  if (aEMessage != null) {
    centerData.aEMessage = aEMessage;
  }
  final int? aOServiceCount = jsonConvert.convert<int>(json['a_o_service_count']);
  if (aOServiceCount != null) {
    centerData.aOServiceCount = aOServiceCount;
  }
  final int? gCreditFraction = jsonConvert.convert<int>(json['g_credit_fraction']);
  if (gCreditFraction != null) {
    centerData.gCreditFraction = gCreditFraction;
  }
  final String? currentLevel = jsonConvert.convert<String>(json['current_level']);
  if (currentLevel != null) {
    centerData.currentLevel = currentLevel;
  }
  final int? fCreditAmount = jsonConvert.convert<int>(json['f_credit_amount']);
  if (fCreditAmount != null) {
    centerData.fCreditAmount = fCreditAmount;
  }
  final int? nextAmount = jsonConvert.convert<int>(json['next_amount']);
  if (nextAmount != null) {
    centerData.nextAmount = nextAmount;
  }
  final String? processTip = jsonConvert.convert<String>(json['process_tip']);
  if (processTip != null) {
    centerData.processTip = processTip;
  }
  final String? lastRefreshTime = jsonConvert.convert<String>(json['last_refresh_time']);
  if (lastRefreshTime != null) {
    centerData.lastRefreshTime = lastRefreshTime;
  }
  final int? showActive = jsonConvert.convert<int>(json['show_active']);
  if (showActive != null) {
    centerData.showActive = showActive;
  }
  final List<CenterDataAmountProgress>? amountProgress =
      (json['amount_progress'] as List<dynamic>?)?.map((e) => jsonConvert.convert<CenterDataAmountProgress>(e) as CenterDataAmountProgress).toList();
  if (amountProgress != null) {
    centerData.amountProgress = amountProgress;
  }
  final List<CenterDataLevelProgress>? levelProgress =
      (json['level_progress'] as List<dynamic>?)?.map((e) => jsonConvert.convert<CenterDataLevelProgress>(e) as CenterDataLevelProgress).toList();
  if (levelProgress != null) {
    centerData.levelProgress = levelProgress;
  }
  final List<double>? point = (json['point'] as List<dynamic>?)?.map((e) => jsonConvert.convert<double>(e) as double).toList();
  if (point != null) {
    centerData.point = point;
  }
  return centerData;
}

Map<String, dynamic> $CenterDataToJson(CenterData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['b_name'] = entity.bName;
  data['a_phone'] = entity.aPhone;
  data['a_e_message'] = entity.aEMessage;
  data['a_o_service_count'] = entity.aOServiceCount;
  data['g_credit_fraction'] = entity.gCreditFraction;
  data['current_level'] = entity.currentLevel;
  data['f_credit_amount'] = entity.fCreditAmount;
  data['next_amount'] = entity.nextAmount;
  data['process_tip'] = entity.processTip;
  data['last_refresh_time'] = entity.lastRefreshTime;
  data['show_active'] = entity.showActive;
  data['amount_progress'] = entity.amountProgress?.map((v) => v.toJson()).toList();
  data['level_progress'] = entity.levelProgress?.map((v) => v.toJson()).toList();
  data['point'] = entity.point;
  return data;
}

extension CenterDataExtension on CenterData {
  CenterData copyWith({
    String? bName,
    String? aPhone,
    int? aEMessage,
    int? aOServiceCount,
    int? gCreditFraction,
    String? currentLevel,
    int? fCreditAmount,
    int? nextAmount,
    String? processTip,
    String? lastRefreshTime,
    int? showActive,
    List<CenterDataAmountProgress>? amountProgress,
    List<CenterDataLevelProgress>? levelProgress,
    List<double>? point,
  }) {
    return CenterData()
      ..bName = bName ?? this.bName
      ..aPhone = aPhone ?? this.aPhone
      ..aEMessage = aEMessage ?? this.aEMessage
      ..aOServiceCount = aOServiceCount ?? this.aOServiceCount
      ..gCreditFraction = gCreditFraction ?? this.gCreditFraction
      ..currentLevel = currentLevel ?? this.currentLevel
      ..fCreditAmount = fCreditAmount ?? this.fCreditAmount
      ..nextAmount = nextAmount ?? this.nextAmount
      ..processTip = processTip ?? this.processTip
      ..lastRefreshTime = lastRefreshTime ?? this.lastRefreshTime
      ..showActive = showActive ?? this.showActive
      ..amountProgress = amountProgress ?? this.amountProgress
      ..levelProgress = levelProgress ?? this.levelProgress
      ..point = point ?? this.point;
  }
}

CenterDataAmountProgress $CenterDataAmountProgressFromJson(Map<String, dynamic> json) {
  final CenterDataAmountProgress centerDataAmountProgress = CenterDataAmountProgress();
  final int? amount = jsonConvert.convert<int>(json['amount']);
  if (amount != null) {
    centerDataAmountProgress.amount = amount;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    centerDataAmountProgress.type = type;
  }
  return centerDataAmountProgress;
}

Map<String, dynamic> $CenterDataAmountProgressToJson(CenterDataAmountProgress entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['type'] = entity.type;
  return data;
}

extension CenterDataAmountProgressExtension on CenterDataAmountProgress {
  CenterDataAmountProgress copyWith({
    int? amount,
    int? type,
  }) {
    return CenterDataAmountProgress()
      ..amount = amount ?? this.amount
      ..type = type ?? this.type;
  }
}

CenterDataLevelProgress $CenterDataLevelProgressFromJson(Map<String, dynamic> json) {
  final CenterDataLevelProgress centerDataLevelProgress = CenterDataLevelProgress();
  final String? level = jsonConvert.convert<String>(json['level']);
  if (level != null) {
    centerDataLevelProgress.level = level;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    centerDataLevelProgress.type = type;
  }
  return centerDataLevelProgress;
}

Map<String, dynamic> $CenterDataLevelProgressToJson(CenterDataLevelProgress entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['level'] = entity.level;
  data['type'] = entity.type;
  return data;
}

extension CenterDataLevelProgressExtension on CenterDataLevelProgress {
  CenterDataLevelProgress copyWith({
    String? level,
    int? type,
  }) {
    return CenterDataLevelProgress()
      ..level = level ?? this.level
      ..type = type ?? this.type;
  }
}