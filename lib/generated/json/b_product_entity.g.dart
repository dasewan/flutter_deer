import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/b_product_entity.dart';

BProductEntity $BProductEntityFromJson(Map<dynamic, dynamic> json) {
  final BProductEntity bProductEntity = BProductEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bProductEntity.id = id;
  }
  final int? aProductSnapshotId = jsonConvert.convert<int>(json['a_product_snapshot_id']);
  if (aProductSnapshotId != null) {
    bProductEntity.aProductSnapshotId = aProductSnapshotId;
  }
  final String? bName = jsonConvert.convert<String>(json['b_name']);
  if (bName != null) {
    bProductEntity.bName = bName;
  }
  final int? cAmount = jsonConvert.convert<int>(json['c_amount']);
  if (cAmount != null) {
    bProductEntity.cAmount = cAmount;
  }
  final String? dUnit = jsonConvert.convert<String>(json['d_unit']);
  if (dUnit != null) {
    bProductEntity.dUnit = dUnit;
  }
  final int? eLife = jsonConvert.convert<int>(json['e_life']);
  if (eLife != null) {
    bProductEntity.eLife = eLife;
  }
  final int? fSettlementType = jsonConvert.convert<int>(json['f_settlement_type']);
  if (fSettlementType != null) {
    bProductEntity.fSettlementType = fSettlementType;
  }
  final int? gInterest = jsonConvert.convert<int>(json['g_interest']);
  if (gInterest != null) {
    bProductEntity.gInterest = gInterest;
  }
  final int? hServiceFeeRate = jsonConvert.convert<int>(json['h_service_fee_rate']);
  if (hServiceFeeRate != null) {
    bProductEntity.hServiceFeeRate = hServiceFeeRate;
  }
  final int? iOverdueRate = jsonConvert.convert<int>(json['i_overdue_rate']);
  if (iOverdueRate != null) {
    bProductEntity.iOverdueRate = iOverdueRate;
  }
  final int? jViolateFeeRate = jsonConvert.convert<int>(json['j_violate_fee_rate']);
  if (jViolateFeeRate != null) {
    bProductEntity.jViolateFeeRate = jViolateFeeRate;
  }
  final int? kExtendRate = jsonConvert.convert<int>(json['k_extend_rate']);
  if (kExtendRate != null) {
    bProductEntity.kExtendRate = kExtendRate;
  }
  final int? lMinPay = jsonConvert.convert<int>(json['l_min_pay']);
  if (lMinPay != null) {
    bProductEntity.lMinPay = lMinPay;
  }
  final String? mCanPartPay = jsonConvert.convert<String>(json['m_can_part_pay']);
  if (mCanPartPay != null) {
    bProductEntity.mCanPartPay = mCanPartPay;
  }
  final String? nCanExtend = jsonConvert.convert<String>(json['n_can_extend']);
  if (nCanExtend != null) {
    bProductEntity.nCanExtend = nCanExtend;
  }
  final int? oType = jsonConvert.convert<int>(json['o_type']);
  if (oType != null) {
    bProductEntity.oType = oType;
  }
  final String? pUrl = jsonConvert.convert<String>(json['p_url']);
  if (pUrl != null) {
    bProductEntity.pUrl = pUrl;
  }
  final int? qUnlockCreditFraction = jsonConvert.convert<int>(json['q_unlock_credit_fraction']);
  if (qUnlockCreditFraction != null) {
    bProductEntity.qUnlockCreditFraction = qUnlockCreditFraction;
  }
  final int? rSettledTimes = jsonConvert.convert<int>(json['r_settled_times']);
  if (rSettledTimes != null) {
    bProductEntity.rSettledTimes = rSettledTimes;
  }
  final int? sMaxOverdueDays = jsonConvert.convert<int>(json['s_max_overdue_days']);
  if (sMaxOverdueDays != null) {
    bProductEntity.sMaxOverdueDays = sMaxOverdueDays;
  }
  final int? tMaxOverdueTimes = jsonConvert.convert<int>(json['t_max_overdue_times']);
  if (tMaxOverdueTimes != null) {
    bProductEntity.tMaxOverdueTimes = tMaxOverdueTimes;
  }
  final String? uStatus = jsonConvert.convert<String>(json['u_status']);
  if (uStatus != null) {
    bProductEntity.uStatus = uStatus;
  }
  final int? vSort = jsonConvert.convert<int>(json['v_sort']);
  if (vSort != null) {
    bProductEntity.vSort = vSort;
  }
  final int? wViews = jsonConvert.convert<int>(json['w_views']);
  if (wViews != null) {
    bProductEntity.wViews = wViews;
  }
  final String? xIntroduction = jsonConvert.convert<String>(json['x_introduction']);
  if (xIntroduction != null) {
    bProductEntity.xIntroduction = xIntroduction;
  }
  final String? yComment = jsonConvert.convert<String>(json['y_comment']);
  if (yComment != null) {
    bProductEntity.yComment = yComment;
  }
  final int? zPeriod = jsonConvert.convert<int>(json['z_period']);
  if (zPeriod != null) {
    bProductEntity.zPeriod = zPeriod;
  }
  final int? aAAmountType = jsonConvert.convert<int>(json['a_a_amount_type']);
  if (aAAmountType != null) {
    bProductEntity.aAAmountType = aAAmountType;
  }
  final int? aBDayValidCount = jsonConvert.convert<int>(json['a_b_day_valid_count']);
  if (aBDayValidCount != null) {
    bProductEntity.aBDayValidCount = aBDayValidCount;
  }
  final int? aCSnapshotCount = jsonConvert.convert<int>(json['a_c_snapshot_count']);
  if (aCSnapshotCount != null) {
    bProductEntity.aCSnapshotCount = aCSnapshotCount;
  }
  final String? aDTags = jsonConvert.convert<String>(json['a_d_tags']);
  if (aDTags != null) {
    bProductEntity.aDTags = aDTags;
  }
  final String? aEFeatures = jsonConvert.convert<String>(json['a_e_features']);
  if (aEFeatures != null) {
    bProductEntity.aEFeatures = aEFeatures;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    bProductEntity.updatedAt = updatedAt;
  }
  return bProductEntity;
}

Map<String, dynamic> $BProductEntityToJson(BProductEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_product_snapshot_id'] = entity.aProductSnapshotId;
  data['b_name'] = entity.bName;
  data['c_amount'] = entity.cAmount;
  data['d_unit'] = entity.dUnit;
  data['e_life'] = entity.eLife;
  data['f_settlement_type'] = entity.fSettlementType;
  data['g_interest'] = entity.gInterest;
  data['h_service_fee_rate'] = entity.hServiceFeeRate;
  data['i_overdue_rate'] = entity.iOverdueRate;
  data['j_violate_fee_rate'] = entity.jViolateFeeRate;
  data['k_extend_rate'] = entity.kExtendRate;
  data['l_min_pay'] = entity.lMinPay;
  data['m_can_part_pay'] = entity.mCanPartPay;
  data['n_can_extend'] = entity.nCanExtend;
  data['o_type'] = entity.oType;
  data['p_url'] = entity.pUrl;
  data['q_unlock_credit_fraction'] = entity.qUnlockCreditFraction;
  data['r_settled_times'] = entity.rSettledTimes;
  data['s_max_overdue_days'] = entity.sMaxOverdueDays;
  data['t_max_overdue_times'] = entity.tMaxOverdueTimes;
  data['u_status'] = entity.uStatus;
  data['v_sort'] = entity.vSort;
  data['w_views'] = entity.wViews;
  data['x_introduction'] = entity.xIntroduction;
  data['y_comment'] = entity.yComment;
  data['z_period'] = entity.zPeriod;
  data['a_a_amount_type'] = entity.aAAmountType;
  data['a_b_day_valid_count'] = entity.aBDayValidCount;
  data['a_c_snapshot_count'] = entity.aCSnapshotCount;
  data['a_d_tags'] = entity.aDTags;
  data['a_e_features'] = entity.aEFeatures;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension BProductEntityExtension on BProductEntity {
  BProductEntity copyWith({
    int? id,
    int? aProductSnapshotId,
    String? bName,
    int? cAmount,
    String? dUnit,
    int? eLife,
    int? fSettlementType,
    int? gInterest,
    int? hServiceFeeRate,
    int? iOverdueRate,
    int? jViolateFeeRate,
    int? kExtendRate,
    int? lMinPay,
    String? mCanPartPay,
    String? nCanExtend,
    int? oType,
    String? pUrl,
    int? qUnlockCreditFraction,
    int? rSettledTimes,
    int? sMaxOverdueDays,
    int? tMaxOverdueTimes,
    String? uStatus,
    int? vSort,
    int? wViews,
    String? xIntroduction,
    String? yComment,
    int? zPeriod,
    int? aAAmountType,
    int? aBDayValidCount,
    int? aCSnapshotCount,
    String? aDTags,
    String? aEFeatures,
    String? updatedAt,
  }) {
    return BProductEntity()
      ..id = id ?? this.id
      ..aProductSnapshotId = aProductSnapshotId ?? this.aProductSnapshotId
      ..bName = bName ?? this.bName
      ..cAmount = cAmount ?? this.cAmount
      ..dUnit = dUnit ?? this.dUnit
      ..eLife = eLife ?? this.eLife
      ..fSettlementType = fSettlementType ?? this.fSettlementType
      ..gInterest = gInterest ?? this.gInterest
      ..hServiceFeeRate = hServiceFeeRate ?? this.hServiceFeeRate
      ..iOverdueRate = iOverdueRate ?? this.iOverdueRate
      ..jViolateFeeRate = jViolateFeeRate ?? this.jViolateFeeRate
      ..kExtendRate = kExtendRate ?? this.kExtendRate
      ..lMinPay = lMinPay ?? this.lMinPay
      ..mCanPartPay = mCanPartPay ?? this.mCanPartPay
      ..nCanExtend = nCanExtend ?? this.nCanExtend
      ..oType = oType ?? this.oType
      ..pUrl = pUrl ?? this.pUrl
      ..qUnlockCreditFraction = qUnlockCreditFraction ?? this.qUnlockCreditFraction
      ..rSettledTimes = rSettledTimes ?? this.rSettledTimes
      ..sMaxOverdueDays = sMaxOverdueDays ?? this.sMaxOverdueDays
      ..tMaxOverdueTimes = tMaxOverdueTimes ?? this.tMaxOverdueTimes
      ..uStatus = uStatus ?? this.uStatus
      ..vSort = vSort ?? this.vSort
      ..wViews = wViews ?? this.wViews
      ..xIntroduction = xIntroduction ?? this.xIntroduction
      ..yComment = yComment ?? this.yComment
      ..zPeriod = zPeriod ?? this.zPeriod
      ..aAAmountType = aAAmountType ?? this.aAAmountType
      ..aBDayValidCount = aBDayValidCount ?? this.aBDayValidCount
      ..aCSnapshotCount = aCSnapshotCount ?? this.aCSnapshotCount
      ..aDTags = aDTags ?? this.aDTags
      ..aEFeatures = aEFeatures ?? this.aEFeatures
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}