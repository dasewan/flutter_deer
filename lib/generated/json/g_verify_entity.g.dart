import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/g_verify_entity.dart';

GVerifyEntity $GVerifyEntityFromJson(Map<dynamic, dynamic> json) {
  final GVerifyEntity gVerifyEntity = GVerifyEntity();
  final int? aUserId = jsonConvert.convert<int>(json['a_user_id']);
  if (aUserId != null) {
    gVerifyEntity.aUserId = aUserId;
  }
  final int? bBorrowId = jsonConvert.convert<int>(json['b_borrow_id']);
  if (bBorrowId != null) {
    gVerifyEntity.bBorrowId = bBorrowId;
  }
  final int? cRiskId = jsonConvert.convert<int>(json['c_risk_id']);
  if (cRiskId != null) {
    gVerifyEntity.cRiskId = cRiskId;
  }
  final int? dRiskScore = jsonConvert.convert<int>(json['d_risk_score']);
  if (dRiskScore != null) {
    gVerifyEntity.dRiskScore = dRiskScore;
  }
  final String? eRiskResult = jsonConvert.convert<String>(json['e_risk_result']);
  if (eRiskResult != null) {
    gVerifyEntity.eRiskResult = eRiskResult;
  }
  final int? fStatus = jsonConvert.convert<int>(json['f_status']);
  if (fStatus != null) {
    gVerifyEntity.fStatus = fStatus;
  }
  final String? g = jsonConvert.convert<String>(json['g_']);
  if (g != null) {
    gVerifyEntity.g = g;
  }
  final String? hNextExpiredDate = jsonConvert.convert<String>(json['h_next_expired_date']);
  if (hNextExpiredDate != null) {
    gVerifyEntity.hNextExpiredDate = hNextExpiredDate;
  }
  final int? iIdnumberVerifyId = jsonConvert.convert<int>(json['i_idnumber_verify_id']);
  if (iIdnumberVerifyId != null) {
    gVerifyEntity.iIdnumberVerifyId = iIdnumberVerifyId;
  }
  final int? jIdnumberVerifyStatus = jsonConvert.convert<int>(json['j_idnumber_verify_status']);
  if (jIdnumberVerifyStatus != null) {
    gVerifyEntity.jIdnumberVerifyStatus = jIdnumberVerifyStatus;
  }
  final dynamic kLivenessVerifyId = json['k_liveness_verify_id'];
  if (kLivenessVerifyId != null) {
    gVerifyEntity.kLivenessVerifyId = kLivenessVerifyId;
  }
  final int? lLivenessVerifyStatus = jsonConvert.convert<int>(json['l_liveness_verify_status']);
  if (lLivenessVerifyStatus != null) {
    gVerifyEntity.lLivenessVerifyStatus = lLivenessVerifyStatus;
  }
  final dynamic mContactVerifyId = json['m_contact_verify_id'];
  if (mContactVerifyId != null) {
    gVerifyEntity.mContactVerifyId = mContactVerifyId;
  }
  final int? nContactVerifyStatus = jsonConvert.convert<int>(json['n_contact_verify_status']);
  if (nContactVerifyStatus != null) {
    gVerifyEntity.nContactVerifyStatus = nContactVerifyStatus;
  }
  final dynamic oJobVerifyId = json['o_job_verify_id'];
  if (oJobVerifyId != null) {
    gVerifyEntity.oJobVerifyId = oJobVerifyId;
  }
  final int? pJobVerifyStatus = jsonConvert.convert<int>(json['p_job_verify_status']);
  if (pJobVerifyStatus != null) {
    gVerifyEntity.pJobVerifyStatus = pJobVerifyStatus;
  }
  final dynamic qLoanBankId = json['q_loan_bank_id'];
  if (qLoanBankId != null) {
    gVerifyEntity.qLoanBankId = qLoanBankId;
  }
  final int? rLoanBankStatus = jsonConvert.convert<int>(json['r_loan_bank_verify_status']);
  if (rLoanBankStatus != null) {
    gVerifyEntity.rLoanBankStatus = rLoanBankStatus;
  }
  final dynamic sRepayBankId = json['s_repay_bank_id'];
  if (sRepayBankId != null) {
    gVerifyEntity.sRepayBankId = sRepayBankId;
  }
  final int? tRepayBankStatus = jsonConvert.convert<int>(json['t_repay_bank_verify_status']);
  if (tRepayBankStatus != null) {
    gVerifyEntity.tRepayBankStatus = tRepayBankStatus;
  }
  final dynamic uH5VerifyId = json['u_h5_verify_id'];
  if (uH5VerifyId != null) {
    gVerifyEntity.uH5VerifyId = uH5VerifyId;
  }
  final dynamic vH5VerifyStatus = json['v_h5_verify_status'];
  if (vH5VerifyStatus != null) {
    gVerifyEntity.vH5VerifyStatus = vH5VerifyStatus;
  }
  final dynamic xOcrVerifyId = json['x_ocr_verify_id'];
  if (xOcrVerifyId != null) {
    gVerifyEntity.xOcrVerifyId = xOcrVerifyId;
  }
  final dynamic yOcrVerifyStatus = json['y_ocr_verify_status'];
  if (yOcrVerifyStatus != null) {
    gVerifyEntity.yOcrVerifyStatus = yOcrVerifyStatus;
  }
  final dynamic zSupplementVerifyId = json['z_supplement_verify_id'];
  if (zSupplementVerifyId != null) {
    gVerifyEntity.zSupplementVerifyId = zSupplementVerifyId;
  }
  final dynamic aASupplementVerifyStatus = json['aa_supplement_verify_status'];
  if (aASupplementVerifyStatus != null) {
    gVerifyEntity.aASupplementVerifyStatus = aASupplementVerifyStatus;
  }
  final dynamic updatedAt = json['updated_at'];
  if (updatedAt != null) {
    gVerifyEntity.updatedAt = updatedAt;
  }
  return gVerifyEntity;
}

Map<String, dynamic> $GVerifyEntityToJson(GVerifyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['a_user_id'] = entity.aUserId;
  data['b_borrow_id'] = entity.bBorrowId;
  data['c_risk_id'] = entity.cRiskId;
  data['d_risk_score'] = entity.dRiskScore;
  data['e_risk_result'] = entity.eRiskResult;
  data['f_status'] = entity.fStatus;
  data['g_'] = entity.g;
  data['h_next_expired_date'] = entity.hNextExpiredDate;
  data['i_idnumber_verify_id'] = entity.iIdnumberVerifyId;
  data['j_idnumber_verify_status'] = entity.jIdnumberVerifyStatus;
  data['k_liveness_verify_id'] = entity.kLivenessVerifyId;
  data['l_liveness_verify_status'] = entity.lLivenessVerifyStatus;
  data['m_contact_verify_id'] = entity.mContactVerifyId;
  data['n_contact_verify_status'] = entity.nContactVerifyStatus;
  data['o_job_verify_id'] = entity.oJobVerifyId;
  data['p_job_verify_status'] = entity.pJobVerifyStatus;
  data['q_loan_bank_id'] = entity.qLoanBankId;
  data['r_loan_bank_verify_status'] = entity.rLoanBankStatus;
  data['s_repay_bank_id'] = entity.sRepayBankId;
  data['t_repay_bank_verify_status'] = entity.tRepayBankStatus;
  data['u_h5_verify_id'] = entity.uH5VerifyId;
  data['v_h5_verify_status'] = entity.vH5VerifyStatus;
  data['x_ocr_verify_id'] = entity.xOcrVerifyId;
  data['y_ocr_verify_status'] = entity.yOcrVerifyStatus;
  data['z_supplement_verify_id'] = entity.zSupplementVerifyId;
  data['aa_supplement_verify_status'] = entity.aASupplementVerifyStatus;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension GVerifyEntityExtension on GVerifyEntity {
  GVerifyEntity copyWith({
    int? aUserId,
    int? bBorrowId,
    int? cRiskId,
    int? dRiskScore,
    String? eRiskResult,
    int? fStatus,
    String? g,
    String? hNextExpiredDate,
    int? iIdnumberVerifyId,
    int? jIdnumberVerifyStatus,
    dynamic kLivenessVerifyId,
    int? lLivenessVerifyStatus,
    dynamic mContactVerifyId,
    int? nContactVerifyStatus,
    dynamic oJobVerifyId,
    int? pJobVerifyStatus,
    dynamic qLoanBankId,
    int? rLoanBankStatus,
    dynamic sRepayBankId,
    int? tRepayBankStatus,
    dynamic uH5VerifyId,
    dynamic vH5VerifyStatus,
    dynamic xOcrVerifyId,
    dynamic yOcrVerifyStatus,
    dynamic zSupplementVerifyId,
    dynamic aASupplementVerifyStatus,
    dynamic updatedAt,
  }) {
    return GVerifyEntity()
      ..aUserId = aUserId ?? this.aUserId
      ..bBorrowId = bBorrowId ?? this.bBorrowId
      ..cRiskId = cRiskId ?? this.cRiskId
      ..dRiskScore = dRiskScore ?? this.dRiskScore
      ..eRiskResult = eRiskResult ?? this.eRiskResult
      ..fStatus = fStatus ?? this.fStatus
      ..g = g ?? this.g
      ..hNextExpiredDate = hNextExpiredDate ?? this.hNextExpiredDate
      ..iIdnumberVerifyId = iIdnumberVerifyId ?? this.iIdnumberVerifyId
      ..jIdnumberVerifyStatus = jIdnumberVerifyStatus ?? this.jIdnumberVerifyStatus
      ..kLivenessVerifyId = kLivenessVerifyId ?? this.kLivenessVerifyId
      ..lLivenessVerifyStatus = lLivenessVerifyStatus ?? this.lLivenessVerifyStatus
      ..mContactVerifyId = mContactVerifyId ?? this.mContactVerifyId
      ..nContactVerifyStatus = nContactVerifyStatus ?? this.nContactVerifyStatus
      ..oJobVerifyId = oJobVerifyId ?? this.oJobVerifyId
      ..pJobVerifyStatus = pJobVerifyStatus ?? this.pJobVerifyStatus
      ..qLoanBankId = qLoanBankId ?? this.qLoanBankId
      ..rLoanBankStatus = rLoanBankStatus ?? this.rLoanBankStatus
      ..sRepayBankId = sRepayBankId ?? this.sRepayBankId
      ..tRepayBankStatus = tRepayBankStatus ?? this.tRepayBankStatus
      ..uH5VerifyId = uH5VerifyId ?? this.uH5VerifyId
      ..vH5VerifyStatus = vH5VerifyStatus ?? this.vH5VerifyStatus
      ..xOcrVerifyId = xOcrVerifyId ?? this.xOcrVerifyId
      ..yOcrVerifyStatus = yOcrVerifyStatus ?? this.yOcrVerifyStatus
      ..zSupplementVerifyId = zSupplementVerifyId ?? this.zSupplementVerifyId
      ..aASupplementVerifyStatus = aASupplementVerifyStatus ?? this.aASupplementVerifyStatus
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}