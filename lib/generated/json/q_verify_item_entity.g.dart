import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';

QVerifyItemEntity $QVerifyItemEntityFromJson(Map<dynamic, dynamic> json) {
  final QVerifyItemEntity qVerifyItemEntity = QVerifyItemEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    qVerifyItemEntity.id = id;
  }
  final int? aParentId = jsonConvert.convert<int>(json['a_parent_id']);
  if (aParentId != null) {
    qVerifyItemEntity.aParentId = aParentId;
  }
  final String? bName = jsonConvert.convert<String>(json['b_name']);
  if (bName != null) {
    qVerifyItemEntity.bName = bName;
  }
  final String? cCode = jsonConvert.convert<String>(json['c_code']);
  if (cCode != null) {
    qVerifyItemEntity.cCode = cCode;
  }
  final String? dStatus = jsonConvert.convert<String>(json['d_status']);
  if (dStatus != null) {
    qVerifyItemEntity.dStatus = dStatus;
  }
  final int? eSort = jsonConvert.convert<int>(json['e_sort']);
  if (eSort != null) {
    qVerifyItemEntity.eSort = eSort;
  }
  final int? fValidDays = jsonConvert.convert<int>(json['f_valid_days']);
  if (fValidDays != null) {
    qVerifyItemEntity.fValidDays = fValidDays;
  }
  final String? gEdit = jsonConvert.convert<String>(json['g_edit']);
  if (gEdit != null) {
    qVerifyItemEntity.gEdit = gEdit;
  }
  final String? hOpertional = jsonConvert.convert<String>(json['h_opertional']);
  if (hOpertional != null) {
    qVerifyItemEntity.hOpertional = hOpertional;
  }
  final String? iDescription = jsonConvert.convert<String>(json['i_description']);
  if (iDescription != null) {
    qVerifyItemEntity.iDescription = iDescription;
  }
  final String? jRemark = jsonConvert.convert<String>(json['j_remark']);
  if (jRemark != null) {
    qVerifyItemEntity.jRemark = jRemark;
  }
  final String? kRules = jsonConvert.convert<String>(json['k_rules']);
  if (kRules != null) {
    qVerifyItemEntity.kRules = kRules;
  }
  final String? lType = jsonConvert.convert<String>(json['l_type']);
  if (lType != null) {
    qVerifyItemEntity.lType = lType;
  }
  final String? mTextInputType = jsonConvert.convert<String>(json['m_text_input_type']);
  if (mTextInputType != null) {
    qVerifyItemEntity.mTextInputType = mTextInputType;
  }
  final int? nMaxLength = jsonConvert.convert<int>(json['n_max_length']);
  if (nMaxLength != null) {
    qVerifyItemEntity.nMaxLength = nMaxLength;
  }
  final String? oLabelText = jsonConvert.convert<String>(json['o_label_text']);
  if (oLabelText != null) {
    qVerifyItemEntity.oLabelText = oLabelText;
  }
  final String? pHintText = jsonConvert.convert<String>(json['p_hint_text']);
  if (pHintText != null) {
    qVerifyItemEntity.pHintText = pHintText;
  }
  final String? qValidator = jsonConvert.convert<String>(json['q_validator']);
  if (qValidator != null) {
    qVerifyItemEntity.qValidator = qValidator;
  }
  final String? rMultiValidator = jsonConvert.convert<String>(json['r_multi_validator']);
  if (rMultiValidator != null) {
    qVerifyItemEntity.rMultiValidator = rMultiValidator;
  }
  final String? sOnSubmitted = jsonConvert.convert<String>(json['s_on_submitted']);
  if (sOnSubmitted != null) {
    qVerifyItemEntity.sOnSubmitted = sOnSubmitted;
  }
  final String? tValues = jsonConvert.convert<String>(json['t_values']);
  if (tValues != null) {
    qVerifyItemEntity.tValues = tValues;
  }
  final String? uGroupName = jsonConvert.convert<String>(json['u_group_name']);
  if (uGroupName != null) {
    qVerifyItemEntity.uGroupName = uGroupName;
  }
  final List<QVerifyItemEntity>? children =
      (json['children'] as List<dynamic>?)?.map((e) => jsonConvert.convert<QVerifyItemEntity>(e) as QVerifyItemEntity).toList();
  if (children != null) {
    qVerifyItemEntity.children = children;
  }
  return qVerifyItemEntity;
}

Map<String, dynamic> $QVerifyItemEntityToJson(QVerifyItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_parent_id'] = entity.aParentId;
  data['b_name'] = entity.bName;
  data['c_code'] = entity.cCode;
  data['d_status'] = entity.dStatus;
  data['e_sort'] = entity.eSort;
  data['f_valid_days'] = entity.fValidDays;
  data['g_edit'] = entity.gEdit;
  data['h_opertional'] = entity.hOpertional;
  data['i_description'] = entity.iDescription;
  data['j_remark'] = entity.jRemark;
  data['k_rules'] = entity.kRules;
  data['l_type'] = entity.lType;
  data['m_text_input_type'] = entity.mTextInputType;
  data['n_max_length'] = entity.nMaxLength;
  data['o_label_text'] = entity.oLabelText;
  data['p_hint_text'] = entity.pHintText;
  data['q_validator'] = entity.qValidator;
  data['r_multi_validator'] = entity.rMultiValidator;
  data['s_on_submitted'] = entity.sOnSubmitted;
  data['t_values'] = entity.tValues;
  data['u_group_name'] = entity.uGroupName;
  data['children'] = entity.children?.map((v) => v.toJson()).toList();
  return data;
}

extension QVerifyItemEntityExtension on QVerifyItemEntity {
  QVerifyItemEntity copyWith({
    int? id,
    int? aParentId,
    String? bName,
    String? cCode,
    String? dStatus,
    int? eSort,
    int? fValidDays,
    String? gEdit,
    String? hOpertional,
    String? iDescription,
    String? jRemark,
    String? kRules,
    String? lType,
    String? mTextInputType,
    int? nMaxLength,
    String? oLabelText,
    String? pHintText,
    String? qValidator,
    String? rMultiValidator,
    String? sOnSubmitted,
    String? tValues,
    String? uGroupName,
    List<QVerifyItemEntity>? children,
  }) {
    return QVerifyItemEntity()
      ..id = id ?? this.id
      ..aParentId = aParentId ?? this.aParentId
      ..bName = bName ?? this.bName
      ..cCode = cCode ?? this.cCode
      ..dStatus = dStatus ?? this.dStatus
      ..eSort = eSort ?? this.eSort
      ..fValidDays = fValidDays ?? this.fValidDays
      ..gEdit = gEdit ?? this.gEdit
      ..hOpertional = hOpertional ?? this.hOpertional
      ..iDescription = iDescription ?? this.iDescription
      ..jRemark = jRemark ?? this.jRemark
      ..kRules = kRules ?? this.kRules
      ..lType = lType ?? this.lType
      ..mTextInputType = mTextInputType ?? this.mTextInputType
      ..nMaxLength = nMaxLength ?? this.nMaxLength
      ..oLabelText = oLabelText ?? this.oLabelText
      ..pHintText = pHintText ?? this.pHintText
      ..qValidator = qValidator ?? this.qValidator
      ..rMultiValidator = rMultiValidator ?? this.rMultiValidator
      ..sOnSubmitted = sOnSubmitted ?? this.sOnSubmitted
      ..tValues = tValues ?? this.tValues
      ..uGroupName = uGroupName ?? this.uGroupName
      ..children = children ?? this.children;
  }
}