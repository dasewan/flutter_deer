import 'dart:convert';

import 'package:myapp9/generated/json/b_product_entity.g.dart';
import 'package:myapp9/generated/json/base/json_field.dart';

@JsonSerializable()
class BProductEntity {
  int? id;
  @JSONField(name: "a_product_snapshot_id")
  int? aProductSnapshotId;
  @JSONField(name: "b_name")
  String? bName;
  @JSONField(name: "c_amount")
  int? cAmount;
	@JSONField(name: "d_unit")
	String? dUnit;
	@JSONField(name: "e_life")
	int? eLife;
	@JSONField(name: "f_settlement_type")
	int? fSettlementType;
	@JSONField(name: "g_interest")
	int? gInterest;
	@JSONField(name: "h_service_fee_rate")
	int? hServiceFeeRate;
	@JSONField(name: "i_overdue_rate")
	int? iOverdueRate;
	@JSONField(name: "j_violate_fee_rate")
	int? jViolateFeeRate;
	@JSONField(name: "k_extend_rate")
	int? kExtendRate;
	@JSONField(name: "l_min_pay")
	int? lMinPay;
	@JSONField(name: "m_can_part_pay")
	String? mCanPartPay;
	@JSONField(name: "n_can_extend")
	String? nCanExtend;
	@JSONField(name: "o_type")
	int? oType;
	@JSONField(name: "p_url")
	String? pUrl;
	@JSONField(name: "q_unlock_credit_fraction")
	int? qUnlockCreditFraction;
	@JSONField(name: "r_settled_times")
	int? rSettledTimes;
	@JSONField(name: "s_max_overdue_days")
	int? sMaxOverdueDays;
	@JSONField(name: "t_max_overdue_times")
	int? tMaxOverdueTimes;
	@JSONField(name: "u_status")
	String? uStatus;
	@JSONField(name: "v_sort")
	int? vSort;
	@JSONField(name: "w_views")
	int? wViews;
	@JSONField(name: "x_introduction")
	String? xIntroduction;
	@JSONField(name: "y_comment")
	String? yComment;
	@JSONField(name: "z_period")
	int? zPeriod;
  @JSONField(name: "a_a_amount_type")
  int? aAAmountType;
  @JSONField(name: "a_b_day_valid_count")
  int? aBDayValidCount;
  @JSONField(name: "a_c_snapshot_count")
  int? aCSnapshotCount;
  @JSONField(name: "a_d_tags")
  String? aDTags;
  @JSONField(name: "a_e_features")
  String? aEFeatures;
  @JSONField(name: "updated_at")
  String? updatedAt;

  BProductEntity();

  factory BProductEntity.fromJson(Map<String, dynamic> json) => $BProductEntityFromJson(json);

  Map<String, dynamic> toJson() => $BProductEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}