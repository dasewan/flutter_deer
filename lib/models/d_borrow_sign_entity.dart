import 'package:myapp9/generated/json/d_borrow_sign_entity.g.dart';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/models/sync_entity.dart';

@JsonSerializable()
class DBorrowSignEntity {

	DBorrowSignEntity();

	factory DBorrowSignEntity.fromJson(Map<String, dynamic> json) => $DBorrowSignEntityFromJson(json);

	Map<String, dynamic> toJson() => $DBorrowSignEntityToJson(this);

	bool? success;
	DBorrowSignData? data;
	String? message;

}

@JsonSerializable()
class DBorrowSignData {

	DBorrowSignData();

	factory DBorrowSignData.fromJson(Map<String, dynamic> json) => $DBorrowSignDataFromJson(json);

	Map<String, dynamic> toJson() => $DBorrowSignDataToJson(this);

	@JSONField(name: "pre_compute_list")
	List<DBorrowSignDataPreComputeItem>? preComputeList;
	@JSONField(name: "sync_info")
	SyncEntity? syncInfo;
	@JSONField(name: "last_fetch_time")
	String? lastFetchTime;
	@JSONField(name: "confirm")
	String? confirm;
}

@JsonSerializable()
class DBorrowSignDataPreComputeItem {

	DBorrowSignDataPreComputeItem();

	factory DBorrowSignDataPreComputeItem.fromJson(Map<String, dynamic> json) => $DBorrowSignDataPreComputeItemFromJson(json);

	Map<String, dynamic> toJson() => $DBorrowSignDataPreComputeItemToJson(this);

	String? field;
	int? sort;
	String? text;
	String? value;
	String? remark;
}
