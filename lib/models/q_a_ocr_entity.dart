import 'dart:convert';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/q_a_ocr_entity.g.dart';

@JsonSerializable()
class QAOcrEntity {
  bool? success;
  QAOcrData? data;
  String? message;

  QAOcrEntity();

  factory QAOcrEntity.fromJson(Map<String, dynamic> json) => $QAOcrEntityFromJson(json);

  Map<String, dynamic> toJson() => $QAOcrEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class QAOcrData {
  @JSONField(name: "ocr_result")
  QAOcrDataOcrResult? ocrResult;
  String? next;

  QAOcrData();

  factory QAOcrData.fromJson(Map<String, dynamic> json) => $QAOcrDataFromJson(json);

  Map<String, dynamic> toJson() => $QAOcrDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class QAOcrDataOcrResult {
  @JSONField(name: "h_idnumber")
  String? hIdnumber;
  @JSONField(name: "i_idnumber2")
  String? iIdnumber2;
  @JSONField(name: "l_name1")
  String? lName1;
  @JSONField(name: "m_name2")
  String? mName2;
  @JSONField(name: "n_name3")
  String? nName3;
  @JSONField(name: "p_birthday")
  String? pBirthday;

  QAOcrDataOcrResult();

  factory QAOcrDataOcrResult.fromJson(Map<String, dynamic> json) => $QAOcrDataOcrResultFromJson(json);

  Map<String, dynamic> toJson() => $QAOcrDataOcrResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
