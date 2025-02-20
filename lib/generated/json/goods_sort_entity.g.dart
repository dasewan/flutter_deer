import 'package:myapp8/generated/json/base/json_convert_content.dart';
import 'package:myapp8/goods/models/goods_sort_entity.dart';

GoodsSortEntity $GoodsSortEntityFromJson(Map<String, dynamic> json) {
	final GoodsSortEntity goodsSortEntity = GoodsSortEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		goodsSortEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		goodsSortEntity.name = name;
	}
	return goodsSortEntity;
}

Map<String, dynamic> $GoodsSortEntityToJson(GoodsSortEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}