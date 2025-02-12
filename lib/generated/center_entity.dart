import 'dart:convert';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/center_entity.g.dart';

@JsonSerializable()
class CenterEntity {
  bool? success;
  CenterData? data;
  List<dynamic>? other;
  String? message;

  CenterEntity();

  factory CenterEntity.fromJson(Map<String, dynamic> json) => $CenterEntityFromJson(json);

  Map<String, dynamic> toJson() => $CenterEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CenterData {
  @JSONField(name: "b_name")
  String? bName;
  @JSONField(name: "whatsapp")
  String? whatsapp;
  @JSONField(name: "credit_url")
  String? creditUrl;
  @JSONField(name: "a_phone")
  String? aPhone;
  @JSONField(name: "a_e_message")
  int? aEMessage;
  @JSONField(name: "a_o_service_count")
  int? aOServiceCount;
  @JSONField(name: "g_credit_fraction")
  int? gCreditFraction;
  @JSONField(name: "current_level")
  String? currentLevel;
  @JSONField(name: "f_credit_amount")
  int? fCreditAmount;
  @JSONField(name: "next_amount")
  int? nextAmount;
  @JSONField(name: "process_tip")
  String? processTip;
  @JSONField(name: "last_refresh_time")
  String? lastRefreshTime;
  @JSONField(name: "show_active")
  int? showActive;
  @JSONField(name: "amount_progress")
  List<CenterDataAmountProgress>? amountProgress;
  @JSONField(name: "level_progress")
  List<CenterDataLevelProgress>? levelProgress;
  List<double>? point;

  CenterData();

  factory CenterData.fromJson(Map<String, dynamic> json) => $CenterDataFromJson(json);

  Map<String, dynamic> toJson() => $CenterDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CenterDataAmountProgress {
  int? amount;
  int? type;

  CenterDataAmountProgress();

  factory CenterDataAmountProgress.fromJson(Map<String, dynamic> json) => $CenterDataAmountProgressFromJson(json);

  Map<String, dynamic> toJson() => $CenterDataAmountProgressToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CenterDataLevelProgress {
  String? level;
  int? type;

  CenterDataLevelProgress();

  factory CenterDataLevelProgress.fromJson(Map<String, dynamic> json) => $CenterDataLevelProgressFromJson(json);

  Map<String, dynamic> toJson() => $CenterDataLevelProgressToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
