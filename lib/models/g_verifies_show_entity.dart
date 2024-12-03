import 'package:myapp9/generated/json/g_verifies_show_entity.g.dart';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';

@JsonSerializable()
class GVerifiesShowEntity {

	GVerifiesShowEntity();

	factory GVerifiesShowEntity.fromJson(Map<String, dynamic> json) => $GVerifiesShowEntityFromJson(json);

	Map<String, dynamic> toJson() => $GVerifiesShowEntityToJson(this);

	bool? success;
	GVerifiesShowData? data;
	String? message;
}

@JsonSerializable()
class GVerifiesShowData {

	GVerifiesShowData();

	factory GVerifiesShowData.fromJson(Map<String, dynamic> json) => $GVerifiesShowDataFromJson(json);

	Map<String, dynamic> toJson() => $GVerifiesShowDataToJson(this);

	@JSONField(name: "g_verify")
	GVerifyEntity? gVerify;
	@JSONField(name: "q_verify_items")
	List<QVerifyItemEntity>? qVerifyItems;
	@JSONField(name: "last_fetch_time")
	String? lastFetchTime;
	@JSONField(name: "index_action")
	int? indexAction;
}


