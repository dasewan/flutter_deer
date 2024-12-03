import 'package:myapp9/generated/json/d_borrow_store_entity.g.dart';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/models/a_user_entity.dart';

@JsonSerializable()
class DBorrowStoreEntity {

	DBorrowStoreEntity();

	factory DBorrowStoreEntity.fromJson(Map<String, dynamic> json) => $DBorrowStoreEntityFromJson(json);

	Map<String, dynamic> toJson() => $DBorrowStoreEntityToJson(this);

	bool? success;
	DBorrowStoreData? data;
	String? message;
}

@JsonSerializable()
class DBorrowStoreData {

	DBorrowStoreData();

	factory DBorrowStoreData.fromJson(Map<String, dynamic> json) => $DBorrowStoreDataFromJson(json);

	Map<String, dynamic> toJson() => $DBorrowStoreDataToJson(this);

	@JSONField(name: "a_user")
	AUserEntity? aUser;
}

