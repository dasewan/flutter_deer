import 'package:myapp9/generated/d_borrow_index_entity.dart';
import 'package:myapp9/generated/json/base/json_convert_content.dart';

DBorrowIndexEntity $DBorrowIndexEntityFromJson(Map<String, dynamic> json) {
  final DBorrowIndexEntity dBorrowIndexEntity = DBorrowIndexEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    dBorrowIndexEntity.success = success;
  }
  final String? errorMessage = jsonConvert.convert<String>(json['errorMessage']);
  if (errorMessage != null) {
    dBorrowIndexEntity.errorMessage = errorMessage;
  }
  final List<DBorrowIndexData>? data = (json['data'] as List<dynamic>?)?.map((e) => jsonConvert.convert<DBorrowIndexData>(e) as DBorrowIndexData).toList();
  if (data != null) {
    dBorrowIndexEntity.data = data;
  }
  final List<dynamic>? other = (json['other'] as List<dynamic>?)?.map((e) => e).toList();
  if (other != null) {
    dBorrowIndexEntity.other = other;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    dBorrowIndexEntity.total = total;
  }
  final int? currentPage = jsonConvert.convert<int>(json['currentPage']);
  if (currentPage != null) {
    dBorrowIndexEntity.currentPage = currentPage;
  }
  final int? perPage = jsonConvert.convert<int>(json['perPage']);
  if (perPage != null) {
    dBorrowIndexEntity.perPage = perPage;
  }
  return dBorrowIndexEntity;
}

Map<String, dynamic> $DBorrowIndexEntityToJson(DBorrowIndexEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['errorMessage'] = entity.errorMessage;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['other'] = entity.other;
  data['total'] = entity.total;
  data['currentPage'] = entity.currentPage;
  data['perPage'] = entity.perPage;
  return data;
}

extension DBorrowIndexEntityExtension on DBorrowIndexEntity {
  DBorrowIndexEntity copyWith({
    bool? success,
    String? errorMessage,
    List<DBorrowIndexData>? data,
    List<dynamic>? other,
    int? total,
    int? currentPage,
    int? perPage,
  }) {
    return DBorrowIndexEntity()
      ..success = success ?? this.success
      ..errorMessage = errorMessage ?? this.errorMessage
      ..data = data ?? this.data
      ..other = other ?? this.other
      ..total = total ?? this.total
      ..currentPage = currentPage ?? this.currentPage
      ..perPage = perPage ?? this.perPage;
  }
}

DBorrowIndexData $DBorrowIndexDataFromJson(Map<String, dynamic> json) {
  final DBorrowIndexData dBorrowIndexData = DBorrowIndexData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dBorrowIndexData.id = id;
  }
  final int? aUserId = jsonConvert.convert<int>(json['a_user_id']);
  if (aUserId != null) {
    dBorrowIndexData.aUserId = aUserId;
  }
  final String? hSn = jsonConvert.convert<String>(json['h_sn']);
  if (hSn != null) {
    dBorrowIndexData.hSn = hSn;
  }
  final int? jStatus = jsonConvert.convert<int>(json['j_status']);
  if (jStatus != null) {
    dBorrowIndexData.jStatus = jStatus;
  }
  final int? kSubStatus = jsonConvert.convert<int>(json['k_sub_status']);
  if (kSubStatus != null) {
    dBorrowIndexData.kSubStatus = kSubStatus;
  }
  final int? lBorrowCount = jsonConvert.convert<int>(json['l_borrow_count']);
  if (lBorrowCount != null) {
    dBorrowIndexData.lBorrowCount = lBorrowCount;
  }
  final int? mBorrowAmount = jsonConvert.convert<int>(json['m_borrow_amount']);
  if (mBorrowAmount != null) {
    dBorrowIndexData.mBorrowAmount = mBorrowAmount;
  }
  final String? oLoanTime = jsonConvert.convert<String>(json['o_loan_time']);
  if (oLoanTime != null) {
    dBorrowIndexData.oLoanTime = oLoanTime;
  }
  final int? pLoanAmount = jsonConvert.convert<int>(json['p_loan_amount']);
  if (pLoanAmount != null) {
    dBorrowIndexData.pLoanAmount = pLoanAmount;
  }
  final String? qExpectRepayTime = jsonConvert.convert<String>(json['q_expect_repay_time']);
  if (qExpectRepayTime != null) {
    dBorrowIndexData.qExpectRepayTime = qExpectRepayTime;
  }
  final String? tSettledTime = jsonConvert.convert<String>(json['t_settled_time']);
  if (tSettledTime != null) {
    dBorrowIndexData.tSettledTime = tSettledTime;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    dBorrowIndexData.createdAt = createdAt;
  }
  return dBorrowIndexData;
}

Map<String, dynamic> $DBorrowIndexDataToJson(DBorrowIndexData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_user_id'] = entity.aUserId;
  data['h_sn'] = entity.hSn;
  data['j_status'] = entity.jStatus;
  data['k_sub_status'] = entity.kSubStatus;
  data['l_borrow_count'] = entity.lBorrowCount;
  data['m_borrow_amount'] = entity.mBorrowAmount;
  data['o_loan_time'] = entity.oLoanTime;
  data['p_loan_amount'] = entity.pLoanAmount;
  data['q_expect_repay_time'] = entity.qExpectRepayTime;
  data['t_settled_time'] = entity.tSettledTime;
  data['created_at'] = entity.createdAt;
  return data;
}

extension DBorrowIndexDataExtension on DBorrowIndexData {
  DBorrowIndexData copyWith({
    int? id,
    int? aUserId,
    String? hSn,
    int? jStatus,
    int? kSubStatus,
    int? lBorrowCount,
    int? mBorrowAmount,
    String? oLoanTime,
    int? pLoanAmount,
    String? qExpectRepayTime,
    String? tSettledTime,
    String? createdAt,
  }) {
    return DBorrowIndexData()
      ..id = id ?? this.id
      ..aUserId = aUserId ?? this.aUserId
      ..hSn = hSn ?? this.hSn
      ..jStatus = jStatus ?? this.jStatus
      ..kSubStatus = kSubStatus ?? this.kSubStatus
      ..lBorrowCount = lBorrowCount ?? this.lBorrowCount
      ..mBorrowAmount = mBorrowAmount ?? this.mBorrowAmount
      ..oLoanTime = oLoanTime ?? this.oLoanTime
      ..pLoanAmount = pLoanAmount ?? this.pLoanAmount
      ..qExpectRepayTime = qExpectRepayTime ?? this.qExpectRepayTime
      ..tSettledTime = tSettledTime ?? this.tSettledTime
      ..createdAt = createdAt ?? this.createdAt;
  }
}