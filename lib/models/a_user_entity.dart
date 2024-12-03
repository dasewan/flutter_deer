import 'package:myapp9/generated/json/a_user_entity.g.dart';
import 'package:myapp9/generated/json/base/json_field.dart';

@JsonSerializable()
class AUserEntity {

	AUserEntity();

	factory AUserEntity.fromJson(Map<String, dynamic> json) => $AUserEntityFromJson(json);

	Map<String, dynamic> toJson() => $AUserEntityToJson(this);

	@JSONField(name: "n_products")
	String? nProducts;
	@JSONField(name: "f_credit_amount")
	int? fCreditAmount;
	@JSONField(name: "h_index_no")
	int? hIndexNo;
  @JSONField(name: "b_name")
  String? bName;
  @JSONField(name: "o_intervene")
  String? oIntervene;
  @JSONField(name: "i_index_action")
  int? iIndexAction;
  @JSONField(name: "a_phone")
  String? aPhone;
  @JSONField(name: "a_e_message")
  int? aeMessage;
  @JSONField(name: "g_credit_fraction")
  int? gCreditFraction;
  @JSONField(name: "a_f_loan_count")
  int? aFLoanCount;
  @JSONField(name: "a_h_overdue_times")
  int? aHOverdueTimes;
  @JSONField(name: "a_i_repay_max_overdue_days")
  int? aIRepayMaxOverdueDays;
  @JSONField(name: "a_e_message")
  int? aEMessage;
  @JSONField(name: "u_on_way_product_id")
  String? uOnWayProductId;
  @JSONField(name: "r_current_borrow_id")
  String? rCurrentBorrowId;
  @JSONField(name: "t_cur_borrow_status")
  String? tCurBorrowStatus;
}
