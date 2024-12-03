import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/index_first_entity.g.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';

@JsonSerializable()
class IndexFirstEntity {

	IndexFirstEntity();

	factory IndexFirstEntity.fromJson(Map<String, dynamic> json) => $IndexFirstEntityFromJson(json);

	Map<String, dynamic> toJson() => $IndexFirstEntityToJson(this);

	bool? success;
	IndexFirstData? data;
	String? message;
}

@JsonSerializable()
class IndexFirstData {

	IndexFirstData();

  factory IndexFirstData.fromJson(Map<String, dynamic> json) => $IndexFirstDataFromJson(json);

  Map<String, dynamic> toJson() => $IndexFirstDataToJson(this);

  @JSONField(name: "max_time")
  String? maxTime;
  @JSONField(name: "b_products_newest_updated_at")
  String? bProductsNewestUpdatedAt;
  @JSONField(name: "a_user")
  AUserEntity? aUser;
  @JSONField(name: "b_products")
  List<BProductEntity>? bProducts;
  @JSONField(name: "g_verify")
  GVerifyEntity? gVerify;
  @JSONField(name: "q_verify_items")
  List<QVerifyItemEntity>? qVerifyItems;
}


