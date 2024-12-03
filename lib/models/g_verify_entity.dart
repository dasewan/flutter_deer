import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/g_verify_entity.g.dart';

@JsonSerializable()
class GVerifyEntity {

	GVerifyEntity();

	factory GVerifyEntity.fromJson(Map<String, dynamic> json) => $GVerifyEntityFromJson(json);

	Map<String, dynamic> toJson() => $GVerifyEntityToJson(this);

	@JSONField(name: "a_user_id")
	int? aUserId;
	@JSONField(name: "b_borrow_id")
	int? bBorrowId;
	@JSONField(name: "c_risk_id")
	int? cRiskId;
	@JSONField(name: "d_risk_score")
	int? dRiskScore;
  @JSONField(name: "e_risk_result")
  String? eRiskResult;
  @JSONField(name: "f_status")
  int? fStatus;
  @JSONField(name: "g_")
  String? g;
  @JSONField(name: "h_next_expired_date")
  String? hNextExpiredDate;
  @JSONField(name: "i_idnumber_verify_id")
  int? iIdnumberVerifyId;
  @JSONField(name: "j_idnumber_verify_status")
  int? jIdnumberVerifyStatus;
  @JSONField(name: "k_liveness_verify_id")
  dynamic? kLivenessVerifyId;
  @JSONField(name: "l_liveness_verify_status")
  int? lLivenessVerifyStatus;
  @JSONField(name: "m_contact_verify_id")
  dynamic? mContactVerifyId;
  @JSONField(name: "n_contact_verify_status")
  int? nContactVerifyStatus;
  @JSONField(name: "o_job_verify_id")
  dynamic? oJobVerifyId;
  @JSONField(name: "p_job_verify_status")
	int? pJobVerifyStatus;
	@JSONField(name: "q_loan_bank_id")
	dynamic? qLoanBankId;
	@JSONField(name: "r_loan_bank_verify_status")
	int? rLoanBankStatus;
	@JSONField(name: "s_repay_bank_id")
	dynamic? sRepayBankId;
	@JSONField(name: "t_repay_bank_verify_status")
	int? tRepayBankStatus;
	@JSONField(name: "u_h5_verify_id")
	dynamic? uH5VerifyId;
	@JSONField(name: "v_h5_verify_status")
	dynamic? vH5VerifyStatus;
	@JSONField(name: "x_ocr_verify_id")
	dynamic? xOcrVerifyId;
	@JSONField(name: "y_ocr_verify_status")
	dynamic? yOcrVerifyStatus;
	@JSONField(name: "z_supplement_verify_id")
	dynamic? zSupplementVerifyId;
	@JSONField(name: "aa_supplement_verify_status")
	dynamic? aASupplementVerifyStatus;
  @JSONField(name: "updated_at")
  dynamic? updatedAt;
}
