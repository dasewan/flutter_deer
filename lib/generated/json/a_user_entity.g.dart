import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/a_user_entity.dart';

AUserEntity $AUserEntityFromJson(Map<dynamic, dynamic> json) {
  final AUserEntity aUserEntity = AUserEntity();
  final String? nProducts = jsonConvert.convert<String>(json['n_products']);
  if (nProducts != null) {
    aUserEntity.nProducts = nProducts;
  }
  final int? fCreditAmount = jsonConvert.convert<int>(json['f_credit_amount']);
  if (fCreditAmount != null) {
    aUserEntity.fCreditAmount = fCreditAmount;
  }
  final int? hIndexNo = jsonConvert.convert<int>(json['h_index_no']);
  if (hIndexNo != null) {
    aUserEntity.hIndexNo = hIndexNo;
  }
  final String? bName = jsonConvert.convert<String>(json['b_name']);
  if (bName != null) {
    aUserEntity.bName = bName;
  }
  final String? oIntervene = jsonConvert.convert<String>(json['o_intervene']);
  if (oIntervene != null) {
    aUserEntity.oIntervene = oIntervene;
  }
  final int? iIndexAction = jsonConvert.convert<int>(json['i_index_action']);
  if (iIndexAction != null) {
    aUserEntity.iIndexAction = iIndexAction;
  }
  final String? aPhone = jsonConvert.convert<String>(json['a_phone']);
  if (aPhone != null) {
    aUserEntity.aPhone = aPhone;
  }
  final int? aeMessage = jsonConvert.convert<int>(json['a_e_message']);
  if (aeMessage != null) {
    aUserEntity.aeMessage = aeMessage;
  }
  final int? gCreditFraction = jsonConvert.convert<int>(json['g_credit_fraction']);
  if (gCreditFraction != null) {
    aUserEntity.gCreditFraction = gCreditFraction;
  }
  final int? aFLoanCount = jsonConvert.convert<int>(json['a_f_loan_count']);
  if (aFLoanCount != null) {
    aUserEntity.aFLoanCount = aFLoanCount;
  }
  final int? aHOverdueTimes = jsonConvert.convert<int>(json['a_h_overdue_times']);
  if (aHOverdueTimes != null) {
    aUserEntity.aHOverdueTimes = aHOverdueTimes;
  }
  final int? aIRepayMaxOverdueDays = jsonConvert.convert<int>(json['a_i_repay_max_overdue_days']);
  if (aIRepayMaxOverdueDays != null) {
    aUserEntity.aIRepayMaxOverdueDays = aIRepayMaxOverdueDays;
  }
  final int? aEMessage = jsonConvert.convert<int>(json['a_e_message']);
  if (aEMessage != null) {
    aUserEntity.aEMessage = aEMessage;
  }
  final String? uOnWayProductId = jsonConvert.convert<String>(json['u_on_way_product_id']);
  if (uOnWayProductId != null) {
    aUserEntity.uOnWayProductId = uOnWayProductId;
  }
  final String? rCurrentBorrowId = jsonConvert.convert<String>(json['r_current_borrow_id']);
  if (rCurrentBorrowId != null) {
    aUserEntity.rCurrentBorrowId = rCurrentBorrowId;
  }
  final String? tCurBorrowStatus = jsonConvert.convert<String>(json['t_cur_borrow_status']);
  if (tCurBorrowStatus != null) {
    aUserEntity.tCurBorrowStatus = tCurBorrowStatus;
  }
  return aUserEntity;
}

Map<String, dynamic> $AUserEntityToJson(AUserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['n_products'] = entity.nProducts;
  data['f_credit_amount'] = entity.fCreditAmount;
  data['h_index_no'] = entity.hIndexNo;
  data['b_name'] = entity.bName;
  data['o_intervene'] = entity.oIntervene;
  data['i_index_action'] = entity.iIndexAction;
  data['a_phone'] = entity.aPhone;
  data['a_e_message'] = entity.aeMessage;
  data['g_credit_fraction'] = entity.gCreditFraction;
  data['a_f_loan_count'] = entity.aFLoanCount;
  data['a_h_overdue_times'] = entity.aHOverdueTimes;
  data['a_i_repay_max_overdue_days'] = entity.aIRepayMaxOverdueDays;
  data['a_e_message'] = entity.aEMessage;
  data['u_on_way_product_id'] = entity.uOnWayProductId;
  data['r_current_borrow_id'] = entity.rCurrentBorrowId;
  data['t_cur_borrow_status'] = entity.tCurBorrowStatus;
  return data;
}

extension AUserEntityExtension on AUserEntity {
  AUserEntity copyWith({
    String? nProducts,
    int? fCreditAmount,
    int? hIndexNo,
    String? bName,
    String? oIntervene,
    int? iIndexAction,
    String? aPhone,
    int? aeMessage,
    int? gCreditFraction,
    int? aFLoanCount,
    int? aHOverdueTimes,
    int? aIRepayMaxOverdueDays,
    int? aEMessage,
    String? uOnWayProductId,
    String? rCurrentBorrowId,
    String? tCurBorrowStatus,
  }) {
    return AUserEntity()
      ..nProducts = nProducts ?? this.nProducts
      ..fCreditAmount = fCreditAmount ?? this.fCreditAmount
      ..hIndexNo = hIndexNo ?? this.hIndexNo
      ..bName = bName ?? this.bName
      ..oIntervene = oIntervene ?? this.oIntervene
      ..iIndexAction = iIndexAction ?? this.iIndexAction
      ..aPhone = aPhone ?? this.aPhone
      ..aeMessage = aeMessage ?? this.aeMessage
      ..gCreditFraction = gCreditFraction ?? this.gCreditFraction
      ..aFLoanCount = aFLoanCount ?? this.aFLoanCount
      ..aHOverdueTimes = aHOverdueTimes ?? this.aHOverdueTimes
      ..aIRepayMaxOverdueDays = aIRepayMaxOverdueDays ?? this.aIRepayMaxOverdueDays
      ..aEMessage = aEMessage ?? this.aEMessage
      ..uOnWayProductId = uOnWayProductId ?? this.uOnWayProductId
      ..rCurrentBorrowId = rCurrentBorrowId ?? this.rCurrentBorrowId
      ..tCurBorrowStatus = tCurBorrowStatus ?? this.tCurBorrowStatus;
  }
}