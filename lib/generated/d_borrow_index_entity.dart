import 'dart:convert';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/d_borrow_index_entity.g.dart';

@JsonSerializable()
class DBorrowIndexEntity {
  bool? success;
  String? errorMessage;
  List<DBorrowIndexData>? data;
  List<dynamic>? other;
  int? total;
  int? currentPage;
  int? perPage;

  DBorrowIndexEntity();

  factory DBorrowIndexEntity.fromJson(Map<String, dynamic> json) => $DBorrowIndexEntityFromJson(json);

  Map<String, dynamic> toJson() => $DBorrowIndexEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DBorrowIndexData {
  int? id;
  @JSONField(name: "a_user_id")
  int? aUserId;
  @JSONField(name: "h_sn")
  String? hSn;
  @JSONField(name: "j_status")
  int? jStatus;
  @JSONField(name: "k_sub_status")
  int? kSubStatus;
  @JSONField(name: "l_borrow_count")
  int? lBorrowCount;
  @JSONField(name: "m_borrow_amount")
  int? mBorrowAmount;
  @JSONField(name: "o_loan_time")
  String? oLoanTime;
  @JSONField(name: "p_loan_amount")
  int? pLoanAmount;
  @JSONField(name: "q_expect_repay_time")
  String? qExpectRepayTime;
  @JSONField(name: "t_settled_time")
  String? tSettledTime;
  @JSONField(name: "created_at")
  String? createdAt;

  DBorrowIndexData();

  factory DBorrowIndexData.fromJson(Map<String, dynamic> json) => $DBorrowIndexDataFromJson(json);

  Map<String, dynamic> toJson() => $DBorrowIndexDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
