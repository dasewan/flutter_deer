import 'package:myapp9/generated/json/index_no_entity.g.dart';

import 'package:myapp9/generated/json/base/json_field.dart';

@JsonSerializable()
class IndexNoEntity {

	IndexNoEntity();

	factory IndexNoEntity.fromJson(Map<String, dynamic> json) => $IndexNoEntityFromJson(json);

	Map<String, dynamic> toJson() => $IndexNoEntityToJson(this);

	bool? success;
	IndexNoData? data;
	String? message;
}

@JsonSerializable()
class IndexNoData {

	IndexNoData();

	factory IndexNoData.fromJson(Map<String, dynamic> json) => $IndexNoDataFromJson(json);

	Map<String, dynamic> toJson() => $IndexNoDataToJson(this);

	@JSONField(name: "h_index_no")
	int? hIndexNo;
	@JSONField(name: "i_index_action")
	int? iIndexAction;
	@JSONField(name: "ae_message")
	int? aeMessage;
}
