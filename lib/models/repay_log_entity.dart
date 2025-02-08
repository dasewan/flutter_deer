import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/repay_log_entity.g.dart';
import 'dart:convert';
export 'package:myapp9/generated/json/repay_log_entity.g.dart';

@JsonSerializable()
class RepayLogEntity {
	bool? success = false;
	String? errorMessage = '';
	String? message = '';
	List<RepayLogData>? data = [];
	List<dynamic>? other = [];
	int? total = 0;
	int? currentPage = 0;
	int? perPage = 0;
	bool? hasMorePages = false;

	RepayLogEntity();

	factory RepayLogEntity.fromJson(Map<String, dynamic> json) => $RepayLogEntityFromJson(json);

	Map<String, dynamic> toJson() => $RepayLogEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RepayLogData {
	int? id = 0;
	@JSONField(name: 'j_status')
	int? jStatus = 0;
	@JSONField(name: 's_reference')
	String? sReference = '';
	@JSONField(name: 'u_amount')
	int? uAmount = 0;
	@JSONField(name: 'created_at')
	String? createdAt = '';
	@JSONField(name: 'updated_at')
	String? updatedAt = '';

	RepayLogData();

	factory RepayLogData.fromJson(Map<String, dynamic> json) => $RepayLogDataFromJson(json);

	Map<String, dynamic> toJson() => $RepayLogDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}