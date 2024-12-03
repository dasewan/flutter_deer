import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/d_borrow_store_entity.dart';

DBorrowStoreEntity $DBorrowStoreEntityFromJson(Map<String, dynamic> json) {
  final DBorrowStoreEntity dBorrowStoreEntity = DBorrowStoreEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    dBorrowStoreEntity.success = success;
  }
  final DBorrowStoreData? data = jsonConvert.convert<DBorrowStoreData>(json['data']);
  if (data != null) {
    dBorrowStoreEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    dBorrowStoreEntity.message = message;
  }
  return dBorrowStoreEntity;
}

Map<String, dynamic> $DBorrowStoreEntityToJson(DBorrowStoreEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension DBorrowStoreEntityExtension on DBorrowStoreEntity {
  DBorrowStoreEntity copyWith({
    bool? success,
    DBorrowStoreData? data,
    String? message,
  }) {
    return DBorrowStoreEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

DBorrowStoreData $DBorrowStoreDataFromJson(Map<String, dynamic> json) {
  final DBorrowStoreData dBorrowStoreData = DBorrowStoreData();
  final AUserEntity? aUser = jsonConvert.convert<AUserEntity>(json['a_user']);
  if (aUser != null) {
    dBorrowStoreData.aUser = aUser;
  }
  return dBorrowStoreData;
}

Map<String, dynamic> $DBorrowStoreDataToJson(DBorrowStoreData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['a_user'] = entity.aUser?.toJson();
  return data;
}

extension DBorrowStoreDataExtension on DBorrowStoreData {
  DBorrowStoreData copyWith({
    AUserEntity? aUser,
  }) {
    return DBorrowStoreData()..aUser = aUser ?? this.aUser;
  }
}