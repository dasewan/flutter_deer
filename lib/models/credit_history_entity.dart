import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/credit_history_entity.g.dart';
import 'dart:convert';
export 'package:myapp9/generated/json/credit_history_entity.g.dart';

@JsonSerializable()
class CreditHistoryEntity {
	bool? success = false;
	String? errorMessage = '';
	String? message = '';
	List<CreditHistoryData>? data = [];
	List<dynamic>? other = [];
	int? total = 0;
	int? currentPage = 0;
	int? perPage = 0;
	bool? hasMorePages = false;

	CreditHistoryEntity();

	factory CreditHistoryEntity.fromJson(Map<String, dynamic> json) => $CreditHistoryEntityFromJson(json);

	Map<String, dynamic> toJson() => $CreditHistoryEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CreditHistoryData {
	int? id = 0;
	@JSONField(name: "b_type")
	int? bType = 0;
	@JSONField(name: "d_amount")
	int? dAmount = 0;
	@JSONField(name: "j_credit_score")
	int? jCreditScore = 0;
	@JSONField(name: "k_overdue_days")
	int? kOverdueDays = 0;
	@JSONField(name: "c_before_credit_amount")
	int? cBeforeCreditAmount = 0;
	@JSONField(name: "i_before_credit_score")
	int? iBeforeCreditScore = 0;
	@JSONField(name: "l_after_credit_amount")
	int? lAfterCreditAmount = 0;
	@JSONField(name: "m_after_credit_score")
	int? mAfterCreditScore = 0;
	@JSONField(name: "created_at")
	String? createdAt = '';
	@JSONField(name: "updated_at")
	String? updatedAt = '';

	CreditHistoryData();

	factory CreditHistoryData.fromJson(Map<String, dynamic> json) => $CreditHistoryDataFromJson(json);

	Map<String, dynamic> toJson() => $CreditHistoryDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}