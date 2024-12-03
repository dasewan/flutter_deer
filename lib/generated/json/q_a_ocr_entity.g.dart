import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/q_a_ocr_entity.dart';

QAOcrEntity $QAOcrEntityFromJson(Map<dynamic, dynamic> json) {
  final QAOcrEntity qAOcrEntity = QAOcrEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    qAOcrEntity.success = success;
  }
  final QAOcrData? data = jsonConvert.convert<QAOcrData>(json['data']);
  if (data != null) {
    qAOcrEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    qAOcrEntity.message = message;
  }
  return qAOcrEntity;
}

Map<String, dynamic> $QAOcrEntityToJson(QAOcrEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension QAOcrEntityExtension on QAOcrEntity {
  QAOcrEntity copyWith({
    bool? success,
    QAOcrData? data,
    String? message,
  }) {
    return QAOcrEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

QAOcrData $QAOcrDataFromJson(Map<String, dynamic> json) {
  final QAOcrData qAOcrData = QAOcrData();
  final QAOcrDataOcrResult? ocrResult = jsonConvert.convert<QAOcrDataOcrResult>(json['ocr_result']);
  if (ocrResult != null) {
    qAOcrData.ocrResult = ocrResult;
  }
  final String? next = jsonConvert.convert<String>(json['next']);
  if (next != null) {
    qAOcrData.next = next;
  }
  return qAOcrData;
}

Map<String, dynamic> $QAOcrDataToJson(QAOcrData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ocr_result'] = entity.ocrResult?.toJson();
  data['next'] = entity.next;
  return data;
}

extension QAOcrDataExtension on QAOcrData {
  QAOcrData copyWith({
    QAOcrDataOcrResult? ocrResult,
    String? next,
  }) {
    return QAOcrData()
      ..ocrResult = ocrResult ?? this.ocrResult
      ..next = next ?? this.next;
  }
}

QAOcrDataOcrResult $QAOcrDataOcrResultFromJson(Map<String, dynamic> json) {
  final QAOcrDataOcrResult qAOcrDataOcrResult = QAOcrDataOcrResult();
  final String? hIdnumber = jsonConvert.convert<String>(json['h_idnumber']);
  if (hIdnumber != null) {
    qAOcrDataOcrResult.hIdnumber = hIdnumber;
  }
  final String? iIdnumber2 = jsonConvert.convert<String>(json['i_idnumber2']);
  if (iIdnumber2 != null) {
    qAOcrDataOcrResult.iIdnumber2 = iIdnumber2;
  }
  final String? lName1 = jsonConvert.convert<String>(json['l_name1']);
  if (lName1 != null) {
    qAOcrDataOcrResult.lName1 = lName1;
  }
  final String? mName2 = jsonConvert.convert<String>(json['m_name2']);
  if (mName2 != null) {
    qAOcrDataOcrResult.mName2 = mName2;
  }
  final String? nName3 = jsonConvert.convert<String>(json['n_name3']);
  if (nName3 != null) {
    qAOcrDataOcrResult.nName3 = nName3;
  }
  final String? pBirthday = jsonConvert.convert<String>(json['p_birthday']);
  if (pBirthday != null) {
    qAOcrDataOcrResult.pBirthday = pBirthday;
  }
  return qAOcrDataOcrResult;
}

Map<String, dynamic> $QAOcrDataOcrResultToJson(QAOcrDataOcrResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['h_idnumber'] = entity.hIdnumber;
  data['i_idnumber2'] = entity.iIdnumber2;
  data['l_name1'] = entity.lName1;
  data['m_name2'] = entity.mName2;
  data['n_name3'] = entity.nName3;
  data['p_birthday'] = entity.pBirthday;
  return data;
}

extension QAOcrDataOcrResultExtension on QAOcrDataOcrResult {
  QAOcrDataOcrResult copyWith({
    String? hIdnumber,
    String? iIdnumber2,
    String? lName1,
    String? mName2,
    String? nName3,
    String? pBirthday,
  }) {
    return QAOcrDataOcrResult()
      ..hIdnumber = hIdnumber ?? this.hIdnumber
      ..iIdnumber2 = iIdnumber2 ?? this.iIdnumber2
      ..lName1 = lName1 ?? this.lName1
      ..mName2 = mName2 ?? this.mName2
      ..nName3 = nName3 ?? this.nName3
      ..pBirthday = pBirthday ?? this.pBirthday;
  }
}