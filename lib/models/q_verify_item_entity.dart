import 'package:myapp9/generated/json/q_verify_item_entity.g.dart';

import 'package:myapp9/generated/json/base/json_field.dart';

@JsonSerializable()
class QVerifyItemEntity {

	QVerifyItemEntity();

	factory QVerifyItemEntity.fromJson(Map<String, dynamic> json) => $QVerifyItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $QVerifyItemEntityToJson(this);

  int? id;
  @JSONField(name: "a_parent_id")
  int? aParentId;
  @JSONField(name: "b_name")
  String? bName;
  @JSONField(name: "c_code")
  String? cCode;
  @JSONField(name: "d_status")
  String? dStatus;
  @JSONField(name: "e_sort")
  int? eSort;
  @JSONField(name: "f_valid_days")
  int? fValidDays;
  @JSONField(name: "g_edit")
  String? gEdit;
  @JSONField(name: "h_opertional")
  String? hOpertional;
  @JSONField(name: "i_description")
  String? iDescription;
  @JSONField(name: "j_remark")
  String? jRemark;
  @JSONField(name: "k_rules")
  String? kRules;
  @JSONField(name: "l_type")
  String? lType;
  @JSONField(name: "m_text_input_type")
  String? mTextInputType;
  @JSONField(name: "n_max_length")
  int? nMaxLength;
  @JSONField(name: "o_label_text")
  String? oLabelText;
  @JSONField(name: "p_hint_text")
  String? pHintText;
  @JSONField(name: "q_validator")
  String? qValidator;
  @JSONField(name: "r_multi_validator")
  String? rMultiValidator;
  @JSONField(name: "s_on_submitted")
  String? sOnSubmitted;
  @JSONField(name: "t_values")
  String? tValues;
  @JSONField(name: "u_group_name")
  String? uGroupName;
  @JSONField(name: "children")
  List<QVerifyItemEntity>? children;
}
