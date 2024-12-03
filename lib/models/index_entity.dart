import 'dart:convert';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/index_entity.g.dart';

export 'package:myapp9/generated/json/index_entity.g.dart';

@JsonSerializable()
class IndexEntity {
  bool? success = false;
  IndexData? data;
  List<dynamic>? other = [];
  String? message = '';

  IndexEntity();

  factory IndexEntity.fromJson(Map<String, dynamic> json) => $IndexEntityFromJson(json);

  Map<String, dynamic> toJson() => $IndexEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexData {
  @JSONField(name: "a_user")
  IndexDataAUser? aUser;
  @JSONField(name: "b_products_newest_updated_at")
  String? bProductsNewestUpdatedAt = '';
  @JSONField(name: "b_products")
  List<IndexDataBProducts>? bProducts = [];
  @JSONField(name: "b_c_product_features_updated_at")
  String? bCProductFeaturesUpdatedAt = '';
  @JSONField(name: "b_c_product_features")
  List<IndexDataBCProductFeatures>? bCProductFeatures = [];
  @JSONField(name: "d_borrows_newest_updated_at")
  String? dBorrowsNewestUpdatedAt = '';
  @JSONField(name: "d_borrows")
  List<IndexDataDBorrows>? dBorrows = [];
  @JSONField(name: "r_f_notifications_newest_updated_at")
  String? rFNotificationsNewestUpdatedAt = '';
  @JSONField(name: "r_f_notifications")
  List<IndexDataRFNotifications>? rFNotifications = [];
  @JSONField(name: "q_d_banners_newest_updated_at")
  String? qDBannersNewestUpdatedAt = '';
  @JSONField(name: "q_d_banners")
  List<IndexDataQDBanners>? qDBanners = [];
  IndexDataRemind? remind;
  @JSONField(name: "back_tips_updated_at")
  String? backTipsUpdatedAt = '';
  @JSONField(name: "back_tips")
  List<IndexDataBackTips>? backTips = [];

  IndexData();

  factory IndexData.fromJson(Map<String, dynamic> json) => $IndexDataFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataAUser {
  int? id = 0;
  @JSONField(name: "a_phone")
  String? aPhone = '';
  @JSONField(name: "b_name")
  String? bName = '';
  @JSONField(name: "c_email")
  String? cEmail = '';
  @JSONField(name: "d_id_number")
  String? dIdNumber = '';
  @JSONField(name: "e_bankcard_no")
  String? eBankcardNo = '';
  @JSONField(name: "f_credit_amount")
  int? fCreditAmount = 0;
  @JSONField(name: "g_credit_fraction")
  int? gCreditFraction = 0;
  @JSONField(name: "h_index_no")
  int? hIndexNo = 0;
  @JSONField(name: "i_index_action")
  int? iIndexAction = 0;
  @JSONField(name: "j_facebook")
  String? jFacebook = '';
  @JSONField(name: "k_whatsapp")
  String? kWhatsapp = '';
  @JSONField(name: "l_channel_id")
  int? lChannelId = 0;
  @JSONField(name: "m_channel_hide")
  String? mChannelHide = '';
  @JSONField(name: "n_products")
  String? nProducts = '';
  @JSONField(name: "o_intervene")
  String? oIntervene = '';
  @JSONField(name: "p_block")
  String? pBlock = '';
  @JSONField(name: "q_block_type")
  String? qBlockType = '';
  @JSONField(name: "r_current_borrow_id")
  String? rCurrentBorrowId = '';
  @JSONField(name: "s_current_verify_id")
  int? sCurrentVerifyId = 0;
  @JSONField(name: "t_cur_borrow_status")
  String? tCurBorrowStatus = '';
  @JSONField(name: "u_on_way_product_id")
  String? uOnWayProductId = '';
  @JSONField(name: "v_max_count")
  int? vMaxCount = 0;
  @JSONField(name: "w_register_type")
  String? wRegisterType = '';
  @JSONField(name: "x_tags")
  String? xTags = '';
  @JSONField(name: "y_suspect_unload")
  String? ySuspectUnload = '';
  @JSONField(name: "z_saler_admin_id")
  int? zSalerAdminId = 0;
  @JSONField(name: "a_a_review_admin_id")
  int? aAReviewAdminId = 0;
  @JSONField(name: "a_b_collection_admin_id")
  int? aBCollectionAdminId = 0;
  @JSONField(name: "a_c_coupon_count")
  int? aCCouponCount = 0;
  @JSONField(name: "a_d_invite_count")
  int? aDInviteCount = 0;
  @JSONField(name: "a_e_message")
  int? aEMessage = 0;
  @JSONField(name: "a_f_loan_count")
  int? aFLoanCount = 0;
  @JSONField(name: "a_g_extend_count")
  int? aGExtendCount = 0;
  @JSONField(name: "a_h_overdue_times")
  int? aHOverdueTimes = 0;
  @JSONField(name: "a_i_repay_max_overdue_days")
  dynamic aIRepayMaxOverdueDays;
  @JSONField(name: "a_j_loss")
  int? aJLoss = 0;
  @JSONField(name: "a_k_consume")
  int? aKConsume = 0;
  @JSONField(name: "a_l_last_settled_time")
  dynamic aLLastSettledTime;
  @JSONField(name: "a_m_access_time")
  int? aMAccessTime = 0;
  @JSONField(name: "a_n_total_overdue_days")
  dynamic aNTotalOverdueDays;
  @JSONField(name: "a_o_service_count")
  dynamic aOServiceCount;
  @JSONField(name: "a_p_borrow_count")
  int? aPBorrowCount = 0;
  @JSONField(name: "a_q_settled_count")
  int? aQSettledCount = 0;
  @JSONField(name: "updated_at")
  String? updatedAt = '';

  IndexDataAUser();

  factory IndexDataAUser.fromJson(Map<String, dynamic> json) => $IndexDataAUserFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataAUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataBProducts {
  int? id = 0;
  @JSONField(name: "a_product_snapshot_id")
  int? aProductSnapshotId = 0;
  @JSONField(name: "b_name")
  String? bName = '';
  @JSONField(name: "c_amount")
  int? cAmount = 0;
  @JSONField(name: "d_unit")
  String? dUnit = '';
  @JSONField(name: "e_life")
  int? eLife = 0;
  @JSONField(name: "f_settlement_type")
  int? fSettlementType = 0;
  @JSONField(name: "g_interest")
  int? gInterest = 0;
  @JSONField(name: "h_service_fee_rate")
  int? hServiceFeeRate = 0;
  @JSONField(name: "i_overdue_rate")
  int? iOverdueRate = 0;
  @JSONField(name: "j_violate_fee_rate")
  int? jViolateFeeRate = 0;
  @JSONField(name: "k_extend_rate")
  int? kExtendRate = 0;
  @JSONField(name: "l_min_pay")
  int? lMinPay = 0;
  @JSONField(name: "m_can_part_pay")
  String? mCanPartPay = '';
  @JSONField(name: "n_can_extend")
  String? nCanExtend = '';
  @JSONField(name: "o_type")
  int? oType = 0;
  @JSONField(name: "p_url")
  dynamic pUrl;
  @JSONField(name: "q_unlock_credit_fraction")
  int? qUnlockCreditFraction = 0;
  @JSONField(name: "r_settled_times")
  int? rSettledTimes = 0;
  @JSONField(name: "s_max_overdue_days")
  int? sMaxOverdueDays = 0;
  @JSONField(name: "t_max_overdue_times")
  int? tMaxOverdueTimes = 0;
  @JSONField(name: "u_status")
  String? uStatus = '';
  @JSONField(name: "v_sort")
  int? vSort = 0;
  @JSONField(name: "w_views")
  int? wViews = 0;
  @JSONField(name: "x_introduction")
  String? xIntroduction = '';
  @JSONField(name: "y_comment")
  String? yComment = '';
  @JSONField(name: "z_period")
  int? zPeriod = 0;
  @JSONField(name: "a_a_amount_type")
  int? aAAmountType = 0;
  @JSONField(name: "a_b_day_valid_count")
  int? aBDayValidCount = 0;
  @JSONField(name: "a_c_snapshot_count")
  int? aCSnapshotCount = 0;
  @JSONField(name: "a_d_tags")
  String? aDTags = '';
  @JSONField(name: "a_e_features")
  String? aEFeatures = '';
  @JSONField(name: "a_f_pic")
  dynamic aFPic;
  @JSONField(name: "updated_at")
  String? updatedAt = '';

  IndexDataBProducts();

  factory IndexDataBProducts.fromJson(Map<String, dynamic> json) => $IndexDataBProductsFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataBProductsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataBCProductFeatures {
  int? id = 0;
  @JSONField(name: "b_title")
  String? bTitle = '';

  IndexDataBCProductFeatures();

  factory IndexDataBCProductFeatures.fromJson(Map<String, dynamic> json) => $IndexDataBCProductFeaturesFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataBCProductFeaturesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataDBorrows {
  int? id = 0;
  @JSONField(name: "j_status")
  int? jStatus = 0;
  @JSONField(name: "d_product_id")
  int? dProductId = 0;
  @JSONField(name: "k_sub_status")
  int? kSubStatus = 0;
  @JSONField(name: "m_borrow_amount")
  int? mBorrowAmount = 0;
  @JSONField(name: "q_expect_repay_time")
  dynamic qExpectRepayTime;
  @JSONField(name: "a_i_overdue_days")
  int? aIOverdueDays = 0;
  @JSONField(name: "r_amount_due")
  int? rAmountDue = 0;
  @JSONField(name: "a_u_status_time")
  String? aUStatusTime = '';
  @JSONField(name: "created_at")
  String? createdAt = '';
  @JSONField(name: "updated_at")
  String? updatedAt = '';

  IndexDataDBorrows();

  factory IndexDataDBorrows.fromJson(Map<String, dynamic> json) => $IndexDataDBorrowsFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataDBorrowsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataRFNotifications {
  int? id = 0;
  @JSONField(name: "a_icon")
  String? aIcon = '';
  @JSONField(name: "b_color")
  int? bColor = 0;
  @JSONField(name: "c_content")
  String? cContent = '';
  @JSONField(name: "e_url")
  String? eUrl = '';
  @JSONField(name: "f_type")
  int? fType = 0;
  @JSONField(name: "updated_at")
  String? updatedAt = '';

  IndexDataRFNotifications();

  factory IndexDataRFNotifications.fromJson(Map<String, dynamic> json) => $IndexDataRFNotificationsFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataRFNotificationsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataQDBanners {
  int? id = 0;
  @JSONField(name: "a_title")
  String? aTitle = '';
  @JSONField(name: "b_pic")
  String? bPic = '';
  @JSONField(name: "e_url")
  String? eUrl = '';
  @JSONField(name: "g_type")
  String? gType = '';
  @JSONField(name: "updated_at")
  String? updatedAt = '';

  IndexDataQDBanners();

  factory IndexDataQDBanners.fromJson(Map<String, dynamic> json) => $IndexDataQDBannersFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataQDBannersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataRemind {
  String? title = '';
  String? content = '';
  String? type = '';
  String? date = '';
  String? url = '';
  @JSONField(name: "url_type")
  int? urlType = 0;
  @JSONField(name: "overdue_days")
  int? overdueDays = 0;

  IndexDataRemind();

  factory IndexDataRemind.fromJson(Map<String, dynamic> json) => $IndexDataRemindFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataRemindToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IndexDataBackTips {
  int? id = 0;
  @JSONField(name: "a_type")
  String? aType = '';
  @JSONField(name: "b_content")
  String? bContent = '';

  IndexDataBackTips();

  factory IndexDataBackTips.fromJson(Map<String, dynamic> json) => $IndexDataBackTipsFromJson(json);

  Map<String, dynamic> toJson() => $IndexDataBackTipsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}