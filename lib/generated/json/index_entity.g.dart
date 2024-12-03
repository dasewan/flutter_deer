import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/index_entity.dart';

IndexEntity $IndexEntityFromJson(Map<String, dynamic> json) {
  final IndexEntity indexEntity = IndexEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    indexEntity.success = success;
  }
  final IndexData? data = jsonConvert.convert<IndexData>(json['data']);
  if (data != null) {
    indexEntity.data = data;
  }
  final List<dynamic>? other = (json['other'] as List<dynamic>?)?.map((e) => e).toList();
  if (other != null) {
    indexEntity.other = other;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    indexEntity.message = message;
  }
  return indexEntity;
}

Map<String, dynamic> $IndexEntityToJson(IndexEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['other'] = entity.other;
  data['message'] = entity.message;
  return data;
}

extension IndexEntityExtension on IndexEntity {
  IndexEntity copyWith({
    bool? success,
    IndexData? data,
    List<dynamic>? other,
    String? message,
  }) {
    return IndexEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..other = other ?? this.other
      ..message = message ?? this.message;
  }
}

IndexData $IndexDataFromJson(Map<String, dynamic> json) {
  final IndexData indexData = IndexData();
  final IndexDataAUser? aUser = jsonConvert.convert<IndexDataAUser>(json['a_user']);
  if (aUser != null) {
    indexData.aUser = aUser;
  }
  final String? bProductsNewestUpdatedAt = jsonConvert.convert<String>(json['b_products_newest_updated_at']);
  if (bProductsNewestUpdatedAt != null) {
    indexData.bProductsNewestUpdatedAt = bProductsNewestUpdatedAt;
  }
  final List<IndexDataBProducts>? bProducts =
      (json['b_products'] as List<dynamic>?)?.map((e) => jsonConvert.convert<IndexDataBProducts>(e) as IndexDataBProducts).toList();
  if (bProducts != null) {
    indexData.bProducts = bProducts;
  }
  final String? bCProductFeaturesUpdatedAt = jsonConvert.convert<String>(json['b_c_product_features_updated_at']);
  if (bCProductFeaturesUpdatedAt != null) {
    indexData.bCProductFeaturesUpdatedAt = bCProductFeaturesUpdatedAt;
  }
  final List<IndexDataBCProductFeatures>? bCProductFeatures =
      (json['b_c_product_features'] as List<dynamic>?)?.map((e) => jsonConvert.convert<IndexDataBCProductFeatures>(e) as IndexDataBCProductFeatures).toList();
  if (bCProductFeatures != null) {
    indexData.bCProductFeatures = bCProductFeatures;
  }
  final String? dBorrowsNewestUpdatedAt = jsonConvert.convert<String>(json['d_borrows_newest_updated_at']);
  if (dBorrowsNewestUpdatedAt != null) {
    indexData.dBorrowsNewestUpdatedAt = dBorrowsNewestUpdatedAt;
  }
  final List<IndexDataDBorrows>? dBorrows =
      (json['d_borrows'] as List<dynamic>?)?.map((e) => jsonConvert.convert<IndexDataDBorrows>(e) as IndexDataDBorrows).toList();
  if (dBorrows != null) {
    indexData.dBorrows = dBorrows;
  }
  final String? rFNotificationsNewestUpdatedAt = jsonConvert.convert<String>(json['r_f_notifications_newest_updated_at']);
  if (rFNotificationsNewestUpdatedAt != null) {
    indexData.rFNotificationsNewestUpdatedAt = rFNotificationsNewestUpdatedAt;
  }
  final List<IndexDataRFNotifications>? rFNotifications =
      (json['r_f_notifications'] as List<dynamic>?)?.map((e) => jsonConvert.convert<IndexDataRFNotifications>(e) as IndexDataRFNotifications).toList();
  if (rFNotifications != null) {
    indexData.rFNotifications = rFNotifications;
  }
  final String? qDBannersNewestUpdatedAt = jsonConvert.convert<String>(json['q_d_banners_newest_updated_at']);
  if (qDBannersNewestUpdatedAt != null) {
    indexData.qDBannersNewestUpdatedAt = qDBannersNewestUpdatedAt;
  }
  final List<IndexDataQDBanners>? qDBanners =
      (json['q_d_banners'] as List<dynamic>?)?.map((e) => jsonConvert.convert<IndexDataQDBanners>(e) as IndexDataQDBanners).toList();
  if (qDBanners != null) {
    indexData.qDBanners = qDBanners;
  }
  final IndexDataRemind? remind = jsonConvert.convert<IndexDataRemind>(json['remind']);
  if (remind != null) {
    indexData.remind = remind;
  }
  final String? backTipsUpdatedAt = jsonConvert.convert<String>(json['back_tips_updated_at']);
  if (backTipsUpdatedAt != null) {
    indexData.backTipsUpdatedAt = backTipsUpdatedAt;
  }
  final List<IndexDataBackTips>? backTips =
      (json['back_tips'] as List<dynamic>?)?.map((e) => jsonConvert.convert<IndexDataBackTips>(e) as IndexDataBackTips).toList();
  if (backTips != null) {
    indexData.backTips = backTips;
  }
  return indexData;
}

Map<String, dynamic> $IndexDataToJson(IndexData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['a_user'] = entity.aUser?.toJson();
  data['b_products_newest_updated_at'] = entity.bProductsNewestUpdatedAt;
  data['b_products'] = entity.bProducts?.map((v) => v.toJson()).toList();
  data['b_c_product_features_updated_at'] = entity.bCProductFeaturesUpdatedAt;
  data['b_c_product_features'] = entity.bCProductFeatures?.map((v) => v.toJson()).toList();
  data['d_borrows_newest_updated_at'] = entity.dBorrowsNewestUpdatedAt;
  data['d_borrows'] = entity.dBorrows?.map((v) => v.toJson()).toList();
  data['r_f_notifications_newest_updated_at'] = entity.rFNotificationsNewestUpdatedAt;
  data['r_f_notifications'] = entity.rFNotifications?.map((v) => v.toJson()).toList();
  data['q_d_banners_newest_updated_at'] = entity.qDBannersNewestUpdatedAt;
  data['q_d_banners'] = entity.qDBanners?.map((v) => v.toJson()).toList();
  data['remind'] = entity.remind?.toJson();
  data['back_tips_updated_at'] = entity.backTipsUpdatedAt;
  data['back_tips'] = entity.backTips?.map((v) => v.toJson()).toList();
  return data;
}

extension IndexDataExtension on IndexData {
  IndexData copyWith({
    IndexDataAUser? aUser,
    String? bProductsNewestUpdatedAt,
    List<IndexDataBProducts>? bProducts,
    String? bCProductFeaturesUpdatedAt,
    List<IndexDataBCProductFeatures>? bCProductFeatures,
    String? dBorrowsNewestUpdatedAt,
    List<IndexDataDBorrows>? dBorrows,
    String? rFNotificationsNewestUpdatedAt,
    List<IndexDataRFNotifications>? rFNotifications,
    String? qDBannersNewestUpdatedAt,
    List<IndexDataQDBanners>? qDBanners,
    IndexDataRemind? remind,
    String? backTipsUpdatedAt,
    List<IndexDataBackTips>? backTips,
  }) {
    return IndexData()
      ..aUser = aUser ?? this.aUser
      ..bProductsNewestUpdatedAt = bProductsNewestUpdatedAt ?? this.bProductsNewestUpdatedAt
      ..bProducts = bProducts ?? this.bProducts
      ..bCProductFeaturesUpdatedAt = bCProductFeaturesUpdatedAt ?? this.bCProductFeaturesUpdatedAt
      ..bCProductFeatures = bCProductFeatures ?? this.bCProductFeatures
      ..dBorrowsNewestUpdatedAt = dBorrowsNewestUpdatedAt ?? this.dBorrowsNewestUpdatedAt
      ..dBorrows = dBorrows ?? this.dBorrows
      ..rFNotificationsNewestUpdatedAt = rFNotificationsNewestUpdatedAt ?? this.rFNotificationsNewestUpdatedAt
      ..rFNotifications = rFNotifications ?? this.rFNotifications
      ..qDBannersNewestUpdatedAt = qDBannersNewestUpdatedAt ?? this.qDBannersNewestUpdatedAt
      ..qDBanners = qDBanners ?? this.qDBanners
      ..remind = remind ?? this.remind
      ..backTipsUpdatedAt = backTipsUpdatedAt ?? this.backTipsUpdatedAt
      ..backTips = backTips ?? this.backTips;
  }
}

IndexDataAUser $IndexDataAUserFromJson(Map<String, dynamic> json) {
  final IndexDataAUser indexDataAUser = IndexDataAUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    indexDataAUser.id = id;
  }
  final String? aPhone = jsonConvert.convert<String>(json['a_phone']);
  if (aPhone != null) {
    indexDataAUser.aPhone = aPhone;
  }
  final String? bName = jsonConvert.convert<String>(json['b_name']);
  if (bName != null) {
    indexDataAUser.bName = bName;
  }
  final String? cEmail = jsonConvert.convert<String>(json['c_email']);
  if (cEmail != null) {
    indexDataAUser.cEmail = cEmail;
  }
  final String? dIdNumber = jsonConvert.convert<String>(json['d_id_number']);
  if (dIdNumber != null) {
    indexDataAUser.dIdNumber = dIdNumber;
  }
  final String? eBankcardNo = jsonConvert.convert<String>(json['e_bankcard_no']);
  if (eBankcardNo != null) {
    indexDataAUser.eBankcardNo = eBankcardNo;
  }
  final int? fCreditAmount = jsonConvert.convert<int>(json['f_credit_amount']);
  if (fCreditAmount != null) {
    indexDataAUser.fCreditAmount = fCreditAmount;
  }
  final int? gCreditFraction = jsonConvert.convert<int>(json['g_credit_fraction']);
  if (gCreditFraction != null) {
    indexDataAUser.gCreditFraction = gCreditFraction;
  }
  final int? hIndexNo = jsonConvert.convert<int>(json['h_index_no']);
  if (hIndexNo != null) {
    indexDataAUser.hIndexNo = hIndexNo;
  }
  final int? iIndexAction = jsonConvert.convert<int>(json['i_index_action']);
  if (iIndexAction != null) {
    indexDataAUser.iIndexAction = iIndexAction;
  }
  final String? jFacebook = jsonConvert.convert<String>(json['j_facebook']);
  if (jFacebook != null) {
    indexDataAUser.jFacebook = jFacebook;
  }
  final String? kWhatsapp = jsonConvert.convert<String>(json['k_whatsapp']);
  if (kWhatsapp != null) {
    indexDataAUser.kWhatsapp = kWhatsapp;
  }
  final int? lChannelId = jsonConvert.convert<int>(json['l_channel_id']);
  if (lChannelId != null) {
    indexDataAUser.lChannelId = lChannelId;
  }
  final String? mChannelHide = jsonConvert.convert<String>(json['m_channel_hide']);
  if (mChannelHide != null) {
    indexDataAUser.mChannelHide = mChannelHide;
  }
  final String? nProducts = jsonConvert.convert<String>(json['n_products']);
  if (nProducts != null) {
    indexDataAUser.nProducts = nProducts;
  }
  final String? oIntervene = jsonConvert.convert<String>(json['o_intervene']);
  if (oIntervene != null) {
    indexDataAUser.oIntervene = oIntervene;
  }
  final String? pBlock = jsonConvert.convert<String>(json['p_block']);
  if (pBlock != null) {
    indexDataAUser.pBlock = pBlock;
  }
  final String? qBlockType = jsonConvert.convert<String>(json['q_block_type']);
  if (qBlockType != null) {
    indexDataAUser.qBlockType = qBlockType;
  }
  final String? rCurrentBorrowId = jsonConvert.convert<String>(json['r_current_borrow_id']);
  if (rCurrentBorrowId != null) {
    indexDataAUser.rCurrentBorrowId = rCurrentBorrowId;
  }
  final int? sCurrentVerifyId = jsonConvert.convert<int>(json['s_current_verify_id']);
  if (sCurrentVerifyId != null) {
    indexDataAUser.sCurrentVerifyId = sCurrentVerifyId;
  }
  final String? tCurBorrowStatus = jsonConvert.convert<String>(json['t_cur_borrow_status']);
  if (tCurBorrowStatus != null) {
    indexDataAUser.tCurBorrowStatus = tCurBorrowStatus;
  }
  final String? uOnWayProductId = jsonConvert.convert<String>(json['u_on_way_product_id']);
  if (uOnWayProductId != null) {
    indexDataAUser.uOnWayProductId = uOnWayProductId;
  }
  final int? vMaxCount = jsonConvert.convert<int>(json['v_max_count']);
  if (vMaxCount != null) {
    indexDataAUser.vMaxCount = vMaxCount;
  }
  final String? wRegisterType = jsonConvert.convert<String>(json['w_register_type']);
  if (wRegisterType != null) {
    indexDataAUser.wRegisterType = wRegisterType;
  }
  final String? xTags = jsonConvert.convert<String>(json['x_tags']);
  if (xTags != null) {
    indexDataAUser.xTags = xTags;
  }
  final String? ySuspectUnload = jsonConvert.convert<String>(json['y_suspect_unload']);
  if (ySuspectUnload != null) {
    indexDataAUser.ySuspectUnload = ySuspectUnload;
  }
  final int? zSalerAdminId = jsonConvert.convert<int>(json['z_saler_admin_id']);
  if (zSalerAdminId != null) {
    indexDataAUser.zSalerAdminId = zSalerAdminId;
  }
  final int? aAReviewAdminId = jsonConvert.convert<int>(json['a_a_review_admin_id']);
  if (aAReviewAdminId != null) {
    indexDataAUser.aAReviewAdminId = aAReviewAdminId;
  }
  final int? aBCollectionAdminId = jsonConvert.convert<int>(json['a_b_collection_admin_id']);
  if (aBCollectionAdminId != null) {
    indexDataAUser.aBCollectionAdminId = aBCollectionAdminId;
  }
  final int? aCCouponCount = jsonConvert.convert<int>(json['a_c_coupon_count']);
  if (aCCouponCount != null) {
    indexDataAUser.aCCouponCount = aCCouponCount;
  }
  final int? aDInviteCount = jsonConvert.convert<int>(json['a_d_invite_count']);
  if (aDInviteCount != null) {
    indexDataAUser.aDInviteCount = aDInviteCount;
  }
  final int? aEMessage = jsonConvert.convert<int>(json['a_e_message']);
  if (aEMessage != null) {
    indexDataAUser.aEMessage = aEMessage;
  }
  final int? aFLoanCount = jsonConvert.convert<int>(json['a_f_loan_count']);
  if (aFLoanCount != null) {
    indexDataAUser.aFLoanCount = aFLoanCount;
  }
  final int? aGExtendCount = jsonConvert.convert<int>(json['a_g_extend_count']);
  if (aGExtendCount != null) {
    indexDataAUser.aGExtendCount = aGExtendCount;
  }
  final int? aHOverdueTimes = jsonConvert.convert<int>(json['a_h_overdue_times']);
  if (aHOverdueTimes != null) {
    indexDataAUser.aHOverdueTimes = aHOverdueTimes;
  }
  final dynamic aIRepayMaxOverdueDays = json['a_i_repay_max_overdue_days'];
  if (aIRepayMaxOverdueDays != null) {
    indexDataAUser.aIRepayMaxOverdueDays = aIRepayMaxOverdueDays;
  }
  final int? aJLoss = jsonConvert.convert<int>(json['a_j_loss']);
  if (aJLoss != null) {
    indexDataAUser.aJLoss = aJLoss;
  }
  final int? aKConsume = jsonConvert.convert<int>(json['a_k_consume']);
  if (aKConsume != null) {
    indexDataAUser.aKConsume = aKConsume;
  }
  final dynamic aLLastSettledTime = json['a_l_last_settled_time'];
  if (aLLastSettledTime != null) {
    indexDataAUser.aLLastSettledTime = aLLastSettledTime;
  }
  final int? aMAccessTime = jsonConvert.convert<int>(json['a_m_access_time']);
  if (aMAccessTime != null) {
    indexDataAUser.aMAccessTime = aMAccessTime;
  }
  final dynamic aNTotalOverdueDays = json['a_n_total_overdue_days'];
  if (aNTotalOverdueDays != null) {
    indexDataAUser.aNTotalOverdueDays = aNTotalOverdueDays;
  }
  final dynamic aOServiceCount = json['a_o_service_count'];
  if (aOServiceCount != null) {
    indexDataAUser.aOServiceCount = aOServiceCount;
  }
  final int? aPBorrowCount = jsonConvert.convert<int>(json['a_p_borrow_count']);
  if (aPBorrowCount != null) {
    indexDataAUser.aPBorrowCount = aPBorrowCount;
  }
  final int? aQSettledCount = jsonConvert.convert<int>(json['a_q_settled_count']);
  if (aQSettledCount != null) {
    indexDataAUser.aQSettledCount = aQSettledCount;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    indexDataAUser.updatedAt = updatedAt;
  }
  return indexDataAUser;
}

Map<String, dynamic> $IndexDataAUserToJson(IndexDataAUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_phone'] = entity.aPhone;
  data['b_name'] = entity.bName;
  data['c_email'] = entity.cEmail;
  data['d_id_number'] = entity.dIdNumber;
  data['e_bankcard_no'] = entity.eBankcardNo;
  data['f_credit_amount'] = entity.fCreditAmount;
  data['g_credit_fraction'] = entity.gCreditFraction;
  data['h_index_no'] = entity.hIndexNo;
  data['i_index_action'] = entity.iIndexAction;
  data['j_facebook'] = entity.jFacebook;
  data['k_whatsapp'] = entity.kWhatsapp;
  data['l_channel_id'] = entity.lChannelId;
  data['m_channel_hide'] = entity.mChannelHide;
  data['n_products'] = entity.nProducts;
  data['o_intervene'] = entity.oIntervene;
  data['p_block'] = entity.pBlock;
  data['q_block_type'] = entity.qBlockType;
  data['r_current_borrow_id'] = entity.rCurrentBorrowId;
  data['s_current_verify_id'] = entity.sCurrentVerifyId;
  data['t_cur_borrow_status'] = entity.tCurBorrowStatus;
  data['u_on_way_product_id'] = entity.uOnWayProductId;
  data['v_max_count'] = entity.vMaxCount;
  data['w_register_type'] = entity.wRegisterType;
  data['x_tags'] = entity.xTags;
  data['y_suspect_unload'] = entity.ySuspectUnload;
  data['z_saler_admin_id'] = entity.zSalerAdminId;
  data['a_a_review_admin_id'] = entity.aAReviewAdminId;
  data['a_b_collection_admin_id'] = entity.aBCollectionAdminId;
  data['a_c_coupon_count'] = entity.aCCouponCount;
  data['a_d_invite_count'] = entity.aDInviteCount;
  data['a_e_message'] = entity.aEMessage;
  data['a_f_loan_count'] = entity.aFLoanCount;
  data['a_g_extend_count'] = entity.aGExtendCount;
  data['a_h_overdue_times'] = entity.aHOverdueTimes;
  data['a_i_repay_max_overdue_days'] = entity.aIRepayMaxOverdueDays;
  data['a_j_loss'] = entity.aJLoss;
  data['a_k_consume'] = entity.aKConsume;
  data['a_l_last_settled_time'] = entity.aLLastSettledTime;
  data['a_m_access_time'] = entity.aMAccessTime;
  data['a_n_total_overdue_days'] = entity.aNTotalOverdueDays;
  data['a_o_service_count'] = entity.aOServiceCount;
  data['a_p_borrow_count'] = entity.aPBorrowCount;
  data['a_q_settled_count'] = entity.aQSettledCount;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension IndexDataAUserExtension on IndexDataAUser {
  IndexDataAUser copyWith({
    int? id,
    String? aPhone,
    String? bName,
    String? cEmail,
    String? dIdNumber,
    String? eBankcardNo,
    int? fCreditAmount,
    int? gCreditFraction,
    int? hIndexNo,
    int? iIndexAction,
    String? jFacebook,
    String? kWhatsapp,
    int? lChannelId,
    String? mChannelHide,
    String? nProducts,
    String? oIntervene,
    String? pBlock,
    String? qBlockType,
    String? rCurrentBorrowId,
    int? sCurrentVerifyId,
    String? tCurBorrowStatus,
    String? uOnWayProductId,
    int? vMaxCount,
    String? wRegisterType,
    String? xTags,
    String? ySuspectUnload,
    int? zSalerAdminId,
    int? aAReviewAdminId,
    int? aBCollectionAdminId,
    int? aCCouponCount,
    int? aDInviteCount,
    int? aEMessage,
    int? aFLoanCount,
    int? aGExtendCount,
    int? aHOverdueTimes,
    dynamic aIRepayMaxOverdueDays,
    int? aJLoss,
    int? aKConsume,
    dynamic aLLastSettledTime,
    int? aMAccessTime,
    dynamic aNTotalOverdueDays,
    dynamic aOServiceCount,
    int? aPBorrowCount,
    int? aQSettledCount,
    String? updatedAt,
  }) {
    return IndexDataAUser()
      ..id = id ?? this.id
      ..aPhone = aPhone ?? this.aPhone
      ..bName = bName ?? this.bName
      ..cEmail = cEmail ?? this.cEmail
      ..dIdNumber = dIdNumber ?? this.dIdNumber
      ..eBankcardNo = eBankcardNo ?? this.eBankcardNo
      ..fCreditAmount = fCreditAmount ?? this.fCreditAmount
      ..gCreditFraction = gCreditFraction ?? this.gCreditFraction
      ..hIndexNo = hIndexNo ?? this.hIndexNo
      ..iIndexAction = iIndexAction ?? this.iIndexAction
      ..jFacebook = jFacebook ?? this.jFacebook
      ..kWhatsapp = kWhatsapp ?? this.kWhatsapp
      ..lChannelId = lChannelId ?? this.lChannelId
      ..mChannelHide = mChannelHide ?? this.mChannelHide
      ..nProducts = nProducts ?? this.nProducts
      ..oIntervene = oIntervene ?? this.oIntervene
      ..pBlock = pBlock ?? this.pBlock
      ..qBlockType = qBlockType ?? this.qBlockType
      ..rCurrentBorrowId = rCurrentBorrowId ?? this.rCurrentBorrowId
      ..sCurrentVerifyId = sCurrentVerifyId ?? this.sCurrentVerifyId
      ..tCurBorrowStatus = tCurBorrowStatus ?? this.tCurBorrowStatus
      ..uOnWayProductId = uOnWayProductId ?? this.uOnWayProductId
      ..vMaxCount = vMaxCount ?? this.vMaxCount
      ..wRegisterType = wRegisterType ?? this.wRegisterType
      ..xTags = xTags ?? this.xTags
      ..ySuspectUnload = ySuspectUnload ?? this.ySuspectUnload
      ..zSalerAdminId = zSalerAdminId ?? this.zSalerAdminId
      ..aAReviewAdminId = aAReviewAdminId ?? this.aAReviewAdminId
      ..aBCollectionAdminId = aBCollectionAdminId ?? this.aBCollectionAdminId
      ..aCCouponCount = aCCouponCount ?? this.aCCouponCount
      ..aDInviteCount = aDInviteCount ?? this.aDInviteCount
      ..aEMessage = aEMessage ?? this.aEMessage
      ..aFLoanCount = aFLoanCount ?? this.aFLoanCount
      ..aGExtendCount = aGExtendCount ?? this.aGExtendCount
      ..aHOverdueTimes = aHOverdueTimes ?? this.aHOverdueTimes
      ..aIRepayMaxOverdueDays = aIRepayMaxOverdueDays ?? this.aIRepayMaxOverdueDays
      ..aJLoss = aJLoss ?? this.aJLoss
      ..aKConsume = aKConsume ?? this.aKConsume
      ..aLLastSettledTime = aLLastSettledTime ?? this.aLLastSettledTime
      ..aMAccessTime = aMAccessTime ?? this.aMAccessTime
      ..aNTotalOverdueDays = aNTotalOverdueDays ?? this.aNTotalOverdueDays
      ..aOServiceCount = aOServiceCount ?? this.aOServiceCount
      ..aPBorrowCount = aPBorrowCount ?? this.aPBorrowCount
      ..aQSettledCount = aQSettledCount ?? this.aQSettledCount
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}

IndexDataBProducts $IndexDataBProductsFromJson(Map<dynamic, dynamic> json) {
  final IndexDataBProducts indexDataBProducts = IndexDataBProducts();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    indexDataBProducts.id = id;
  }
  final int? aProductSnapshotId = jsonConvert.convert<int>(json['a_product_snapshot_id']);
  if (aProductSnapshotId != null) {
    indexDataBProducts.aProductSnapshotId = aProductSnapshotId;
  }
  final String? bName = jsonConvert.convert<String>(json['b_name']);
  if (bName != null) {
    indexDataBProducts.bName = bName;
  }
  final int? cAmount = jsonConvert.convert<int>(json['c_amount']);
  if (cAmount != null) {
    indexDataBProducts.cAmount = cAmount;
  }
  final String? dUnit = jsonConvert.convert<String>(json['d_unit']);
  if (dUnit != null) {
    indexDataBProducts.dUnit = dUnit;
  }
  final int? eLife = jsonConvert.convert<int>(json['e_life']);
  if (eLife != null) {
    indexDataBProducts.eLife = eLife;
  }
  final int? fSettlementType = jsonConvert.convert<int>(json['f_settlement_type']);
  if (fSettlementType != null) {
    indexDataBProducts.fSettlementType = fSettlementType;
  }
  final int? gInterest = jsonConvert.convert<int>(json['g_interest']);
  if (gInterest != null) {
    indexDataBProducts.gInterest = gInterest;
  }
  final int? hServiceFeeRate = jsonConvert.convert<int>(json['h_service_fee_rate']);
  if (hServiceFeeRate != null) {
    indexDataBProducts.hServiceFeeRate = hServiceFeeRate;
  }
  final int? iOverdueRate = jsonConvert.convert<int>(json['i_overdue_rate']);
  if (iOverdueRate != null) {
    indexDataBProducts.iOverdueRate = iOverdueRate;
  }
  final int? jViolateFeeRate = jsonConvert.convert<int>(json['j_violate_fee_rate']);
  if (jViolateFeeRate != null) {
    indexDataBProducts.jViolateFeeRate = jViolateFeeRate;
  }
  final int? kExtendRate = jsonConvert.convert<int>(json['k_extend_rate']);
  if (kExtendRate != null) {
    indexDataBProducts.kExtendRate = kExtendRate;
  }
  final int? lMinPay = jsonConvert.convert<int>(json['l_min_pay']);
  if (lMinPay != null) {
    indexDataBProducts.lMinPay = lMinPay;
  }
  final String? mCanPartPay = jsonConvert.convert<String>(json['m_can_part_pay']);
  if (mCanPartPay != null) {
    indexDataBProducts.mCanPartPay = mCanPartPay;
  }
  final String? nCanExtend = jsonConvert.convert<String>(json['n_can_extend']);
  if (nCanExtend != null) {
    indexDataBProducts.nCanExtend = nCanExtend;
  }
  final int? oType = jsonConvert.convert<int>(json['o_type']);
  if (oType != null) {
    indexDataBProducts.oType = oType;
  }
  final dynamic pUrl = json['p_url'];
  if (pUrl != null) {
    indexDataBProducts.pUrl = pUrl;
  }
  final int? qUnlockCreditFraction = jsonConvert.convert<int>(json['q_unlock_credit_fraction']);
  if (qUnlockCreditFraction != null) {
    indexDataBProducts.qUnlockCreditFraction = qUnlockCreditFraction;
  }
  final int? rSettledTimes = jsonConvert.convert<int>(json['r_settled_times']);
  if (rSettledTimes != null) {
    indexDataBProducts.rSettledTimes = rSettledTimes;
  }
  final int? sMaxOverdueDays = jsonConvert.convert<int>(json['s_max_overdue_days']);
  if (sMaxOverdueDays != null) {
    indexDataBProducts.sMaxOverdueDays = sMaxOverdueDays;
  }
  final int? tMaxOverdueTimes = jsonConvert.convert<int>(json['t_max_overdue_times']);
  if (tMaxOverdueTimes != null) {
    indexDataBProducts.tMaxOverdueTimes = tMaxOverdueTimes;
  }
  final String? uStatus = jsonConvert.convert<String>(json['u_status']);
  if (uStatus != null) {
    indexDataBProducts.uStatus = uStatus;
  }
  final int? vSort = jsonConvert.convert<int>(json['v_sort']);
  if (vSort != null) {
    indexDataBProducts.vSort = vSort;
  }
  final int? wViews = jsonConvert.convert<int>(json['w_views']);
  if (wViews != null) {
    indexDataBProducts.wViews = wViews;
  }
  final String? xIntroduction = jsonConvert.convert<String>(json['x_introduction']);
  if (xIntroduction != null) {
    indexDataBProducts.xIntroduction = xIntroduction;
  }
  final String? yComment = jsonConvert.convert<String>(json['y_comment']);
  if (yComment != null) {
    indexDataBProducts.yComment = yComment;
  }
  final int? zPeriod = jsonConvert.convert<int>(json['z_period']);
  if (zPeriod != null) {
    indexDataBProducts.zPeriod = zPeriod;
  }
  final int? aAAmountType = jsonConvert.convert<int>(json['a_a_amount_type']);
  if (aAAmountType != null) {
    indexDataBProducts.aAAmountType = aAAmountType;
  }
  final int? aBDayValidCount = jsonConvert.convert<int>(json['a_b_day_valid_count']);
  if (aBDayValidCount != null) {
    indexDataBProducts.aBDayValidCount = aBDayValidCount;
  }
  final int? aCSnapshotCount = jsonConvert.convert<int>(json['a_c_snapshot_count']);
  if (aCSnapshotCount != null) {
    indexDataBProducts.aCSnapshotCount = aCSnapshotCount;
  }
  final String? aDTags = jsonConvert.convert<String>(json['a_d_tags']);
  if (aDTags != null) {
    indexDataBProducts.aDTags = aDTags;
  }
  final String? aEFeatures = jsonConvert.convert<String>(json['a_e_features']);
  if (aEFeatures != null) {
    indexDataBProducts.aEFeatures = aEFeatures;
  }
  final dynamic aFPic = json['a_f_pic'];
  if (aFPic != null) {
    indexDataBProducts.aFPic = aFPic;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    indexDataBProducts.updatedAt = updatedAt;
  }
  return indexDataBProducts;
}

Map<String, dynamic> $IndexDataBProductsToJson(IndexDataBProducts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_product_snapshot_id'] = entity.aProductSnapshotId;
  data['b_name'] = entity.bName;
  data['c_amount'] = entity.cAmount;
  data['d_unit'] = entity.dUnit;
  data['e_life'] = entity.eLife;
  data['f_settlement_type'] = entity.fSettlementType;
  data['g_interest'] = entity.gInterest;
  data['h_service_fee_rate'] = entity.hServiceFeeRate;
  data['i_overdue_rate'] = entity.iOverdueRate;
  data['j_violate_fee_rate'] = entity.jViolateFeeRate;
  data['k_extend_rate'] = entity.kExtendRate;
  data['l_min_pay'] = entity.lMinPay;
  data['m_can_part_pay'] = entity.mCanPartPay;
  data['n_can_extend'] = entity.nCanExtend;
  data['o_type'] = entity.oType;
  data['p_url'] = entity.pUrl;
  data['q_unlock_credit_fraction'] = entity.qUnlockCreditFraction;
  data['r_settled_times'] = entity.rSettledTimes;
  data['s_max_overdue_days'] = entity.sMaxOverdueDays;
  data['t_max_overdue_times'] = entity.tMaxOverdueTimes;
  data['u_status'] = entity.uStatus;
  data['v_sort'] = entity.vSort;
  data['w_views'] = entity.wViews;
  data['x_introduction'] = entity.xIntroduction;
  data['y_comment'] = entity.yComment;
  data['z_period'] = entity.zPeriod;
  data['a_a_amount_type'] = entity.aAAmountType;
  data['a_b_day_valid_count'] = entity.aBDayValidCount;
  data['a_c_snapshot_count'] = entity.aCSnapshotCount;
  data['a_d_tags'] = entity.aDTags;
  data['a_e_features'] = entity.aEFeatures;
  data['a_f_pic'] = entity.aFPic;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension IndexDataBProductsExtension on IndexDataBProducts {
  IndexDataBProducts copyWith({
    int? id,
    int? aProductSnapshotId,
    String? bName,
    int? cAmount,
    String? dUnit,
    int? eLife,
    int? fSettlementType,
    int? gInterest,
    int? hServiceFeeRate,
    int? iOverdueRate,
    int? jViolateFeeRate,
    int? kExtendRate,
    int? lMinPay,
    String? mCanPartPay,
    String? nCanExtend,
    int? oType,
    dynamic pUrl,
    int? qUnlockCreditFraction,
    int? rSettledTimes,
    int? sMaxOverdueDays,
    int? tMaxOverdueTimes,
    String? uStatus,
    int? vSort,
    int? wViews,
    String? xIntroduction,
    String? yComment,
    int? zPeriod,
    int? aAAmountType,
    int? aBDayValidCount,
    int? aCSnapshotCount,
    String? aDTags,
    String? aEFeatures,
    dynamic aFPic,
    String? updatedAt,
  }) {
    return IndexDataBProducts()
      ..id = id ?? this.id
      ..aProductSnapshotId = aProductSnapshotId ?? this.aProductSnapshotId
      ..bName = bName ?? this.bName
      ..cAmount = cAmount ?? this.cAmount
      ..dUnit = dUnit ?? this.dUnit
      ..eLife = eLife ?? this.eLife
      ..fSettlementType = fSettlementType ?? this.fSettlementType
      ..gInterest = gInterest ?? this.gInterest
      ..hServiceFeeRate = hServiceFeeRate ?? this.hServiceFeeRate
      ..iOverdueRate = iOverdueRate ?? this.iOverdueRate
      ..jViolateFeeRate = jViolateFeeRate ?? this.jViolateFeeRate
      ..kExtendRate = kExtendRate ?? this.kExtendRate
      ..lMinPay = lMinPay ?? this.lMinPay
      ..mCanPartPay = mCanPartPay ?? this.mCanPartPay
      ..nCanExtend = nCanExtend ?? this.nCanExtend
      ..oType = oType ?? this.oType
      ..pUrl = pUrl ?? this.pUrl
      ..qUnlockCreditFraction = qUnlockCreditFraction ?? this.qUnlockCreditFraction
      ..rSettledTimes = rSettledTimes ?? this.rSettledTimes
      ..sMaxOverdueDays = sMaxOverdueDays ?? this.sMaxOverdueDays
      ..tMaxOverdueTimes = tMaxOverdueTimes ?? this.tMaxOverdueTimes
      ..uStatus = uStatus ?? this.uStatus
      ..vSort = vSort ?? this.vSort
      ..wViews = wViews ?? this.wViews
      ..xIntroduction = xIntroduction ?? this.xIntroduction
      ..yComment = yComment ?? this.yComment
      ..zPeriod = zPeriod ?? this.zPeriod
      ..aAAmountType = aAAmountType ?? this.aAAmountType
      ..aBDayValidCount = aBDayValidCount ?? this.aBDayValidCount
      ..aCSnapshotCount = aCSnapshotCount ?? this.aCSnapshotCount
      ..aDTags = aDTags ?? this.aDTags
      ..aEFeatures = aEFeatures ?? this.aEFeatures
      ..aFPic = aFPic ?? this.aFPic
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}

IndexDataBCProductFeatures $IndexDataBCProductFeaturesFromJson(Map<dynamic, dynamic> json) {
  final IndexDataBCProductFeatures indexDataBCProductFeatures = IndexDataBCProductFeatures();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    indexDataBCProductFeatures.id = id;
  }
  final String? bTitle = jsonConvert.convert<String>(json['b_title']);
  if (bTitle != null) {
    indexDataBCProductFeatures.bTitle = bTitle;
  }
  return indexDataBCProductFeatures;
}

Map<String, dynamic> $IndexDataBCProductFeaturesToJson(IndexDataBCProductFeatures entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['b_title'] = entity.bTitle;
  return data;
}

extension IndexDataBCProductFeaturesExtension on IndexDataBCProductFeatures {
  IndexDataBCProductFeatures copyWith({
    int? id,
    String? bTitle,
  }) {
    return IndexDataBCProductFeatures()
      ..id = id ?? this.id
      ..bTitle = bTitle ?? this.bTitle;
  }
}

IndexDataDBorrows $IndexDataDBorrowsFromJson(Map<dynamic, dynamic> json) {
  final IndexDataDBorrows indexDataDBorrows = IndexDataDBorrows();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    indexDataDBorrows.id = id;
  }
  final int? jStatus = jsonConvert.convert<int>(json['j_status']);
  if (jStatus != null) {
    indexDataDBorrows.jStatus = jStatus;
  }
  final int? dProductId = jsonConvert.convert<int>(json['d_product_id']);
  if (dProductId != null) {
    indexDataDBorrows.dProductId = dProductId;
  }
  final int? kSubStatus = jsonConvert.convert<int>(json['k_sub_status']);
  if (kSubStatus != null) {
    indexDataDBorrows.kSubStatus = kSubStatus;
  }
  final int? mBorrowAmount = jsonConvert.convert<int>(json['m_borrow_amount']);
  if (mBorrowAmount != null) {
    indexDataDBorrows.mBorrowAmount = mBorrowAmount;
  }
  final dynamic qExpectRepayTime = json['q_expect_repay_time'];
  if (qExpectRepayTime != null) {
    indexDataDBorrows.qExpectRepayTime = qExpectRepayTime;
  }
  final int? aIOverdueDays = jsonConvert.convert<int>(json['a_i_overdue_days']);
  if (aIOverdueDays != null) {
    indexDataDBorrows.aIOverdueDays = aIOverdueDays;
  }
  final int? rAmountDue = jsonConvert.convert<int>(json['r_amount_due']);
  if (rAmountDue != null) {
    indexDataDBorrows.rAmountDue = rAmountDue;
  }
  final String? aUStatusTime = jsonConvert.convert<String>(json['a_u_status_time']);
  if (aUStatusTime != null) {
    indexDataDBorrows.aUStatusTime = aUStatusTime;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    indexDataDBorrows.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    indexDataDBorrows.updatedAt = updatedAt;
  }
  return indexDataDBorrows;
}

Map<String, dynamic> $IndexDataDBorrowsToJson(IndexDataDBorrows entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['j_status'] = entity.jStatus;
  data['d_product_id'] = entity.dProductId;
  data['k_sub_status'] = entity.kSubStatus;
  data['m_borrow_amount'] = entity.mBorrowAmount;
  data['q_expect_repay_time'] = entity.qExpectRepayTime;
  data['a_i_overdue_days'] = entity.aIOverdueDays;
  data['r_amount_due'] = entity.rAmountDue;
  data['a_u_status_time'] = entity.aUStatusTime;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension IndexDataDBorrowsExtension on IndexDataDBorrows {
  IndexDataDBorrows copyWith({
    int? id,
    int? jStatus,
    int? dProductId,
    int? kSubStatus,
    int? mBorrowAmount,
    dynamic qExpectRepayTime,
    int? aIOverdueDays,
    int? rAmountDue,
    String? aUStatusTime,
    String? createdAt,
    String? updatedAt,
  }) {
    return IndexDataDBorrows()
      ..id = id ?? this.id
      ..jStatus = jStatus ?? this.jStatus
      ..dProductId = dProductId ?? this.dProductId
      ..kSubStatus = kSubStatus ?? this.kSubStatus
      ..mBorrowAmount = mBorrowAmount ?? this.mBorrowAmount
      ..qExpectRepayTime = qExpectRepayTime ?? this.qExpectRepayTime
      ..aIOverdueDays = aIOverdueDays ?? this.aIOverdueDays
      ..rAmountDue = rAmountDue ?? this.rAmountDue
      ..aUStatusTime = aUStatusTime ?? this.aUStatusTime
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}

IndexDataRFNotifications $IndexDataRFNotificationsFromJson(Map<dynamic, dynamic> json) {
  final IndexDataRFNotifications indexDataRFNotifications = IndexDataRFNotifications();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    indexDataRFNotifications.id = id;
  }
  final String? aIcon = jsonConvert.convert<String>(json['a_icon']);
  if (aIcon != null) {
    indexDataRFNotifications.aIcon = aIcon;
  }
  final int? bColor = jsonConvert.convert<int>(json['b_color']);
  if (bColor != null) {
    indexDataRFNotifications.bColor = bColor;
  }
  final String? cContent = jsonConvert.convert<String>(json['c_content']);
  if (cContent != null) {
    indexDataRFNotifications.cContent = cContent;
  }
  final String? eUrl = jsonConvert.convert<String>(json['e_url']);
  if (eUrl != null) {
    indexDataRFNotifications.eUrl = eUrl;
  }
  final int? fType = jsonConvert.convert<int>(json['f_type']);
  if (fType != null) {
    indexDataRFNotifications.fType = fType;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    indexDataRFNotifications.updatedAt = updatedAt;
  }
  return indexDataRFNotifications;
}

Map<String, dynamic> $IndexDataRFNotificationsToJson(IndexDataRFNotifications entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_icon'] = entity.aIcon;
  data['b_color'] = entity.bColor;
  data['c_content'] = entity.cContent;
  data['e_url'] = entity.eUrl;
  data['f_type'] = entity.fType;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension IndexDataRFNotificationsExtension on IndexDataRFNotifications {
  IndexDataRFNotifications copyWith({
    int? id,
    String? aIcon,
    int? bColor,
    String? cContent,
    String? eUrl,
    int? fType,
    String? updatedAt,
  }) {
    return IndexDataRFNotifications()
      ..id = id ?? this.id
      ..aIcon = aIcon ?? this.aIcon
      ..bColor = bColor ?? this.bColor
      ..cContent = cContent ?? this.cContent
      ..eUrl = eUrl ?? this.eUrl
      ..fType = fType ?? this.fType
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}

IndexDataQDBanners $IndexDataQDBannersFromJson(Map<dynamic, dynamic> json) {
  final IndexDataQDBanners indexDataQDBanners = IndexDataQDBanners();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    indexDataQDBanners.id = id;
  }
  final String? aTitle = jsonConvert.convert<String>(json['a_title']);
  if (aTitle != null) {
    indexDataQDBanners.aTitle = aTitle;
  }
  final String? bPic = jsonConvert.convert<String>(json['b_pic']);
  if (bPic != null) {
    indexDataQDBanners.bPic = bPic;
  }
  final String? eUrl = jsonConvert.convert<String>(json['e_url']);
  if (eUrl != null) {
    indexDataQDBanners.eUrl = eUrl;
  }
  final String? gType = jsonConvert.convert<String>(json['g_type']);
  if (gType != null) {
    indexDataQDBanners.gType = gType;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    indexDataQDBanners.updatedAt = updatedAt;
  }
  return indexDataQDBanners;
}

Map<String, dynamic> $IndexDataQDBannersToJson(IndexDataQDBanners entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_title'] = entity.aTitle;
  data['b_pic'] = entity.bPic;
  data['e_url'] = entity.eUrl;
  data['g_type'] = entity.gType;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension IndexDataQDBannersExtension on IndexDataQDBanners {
  IndexDataQDBanners copyWith({
    int? id,
    String? aTitle,
    String? bPic,
    String? eUrl,
    String? gType,
    String? updatedAt,
  }) {
    return IndexDataQDBanners()
      ..id = id ?? this.id
      ..aTitle = aTitle ?? this.aTitle
      ..bPic = bPic ?? this.bPic
      ..eUrl = eUrl ?? this.eUrl
      ..gType = gType ?? this.gType
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}

IndexDataRemind $IndexDataRemindFromJson(Map<String, dynamic> json) {
  final IndexDataRemind indexDataRemind = IndexDataRemind();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    indexDataRemind.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    indexDataRemind.content = content;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    indexDataRemind.type = type;
  }
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    indexDataRemind.date = date;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    indexDataRemind.url = url;
  }
  final int? urlType = jsonConvert.convert<int>(json['url_type']);
  if (urlType != null) {
    indexDataRemind.urlType = urlType;
  }
  final int? overdueDays = jsonConvert.convert<int>(json['overdue_days']);
  if (overdueDays != null) {
    indexDataRemind.overdueDays = overdueDays;
  }
  return indexDataRemind;
}

Map<String, dynamic> $IndexDataRemindToJson(IndexDataRemind entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['content'] = entity.content;
  data['type'] = entity.type;
  data['date'] = entity.date;
  data['url'] = entity.url;
  data['url_type'] = entity.urlType;
  data['overdue_days'] = entity.overdueDays;
  return data;
}

extension IndexDataRemindExtension on IndexDataRemind {
  IndexDataRemind copyWith({
    String? title,
    String? content,
    String? type,
    String? date,
    String? url,
    int? urlType,
    int? overdueDays,
  }) {
    return IndexDataRemind()
      ..title = title ?? this.title
      ..content = content ?? this.content
      ..type = type ?? this.type
      ..date = date ?? this.date
      ..url = url ?? this.url
      ..urlType = urlType ?? this.urlType
      ..overdueDays = overdueDays ?? this.overdueDays;
  }
}

IndexDataBackTips $IndexDataBackTipsFromJson(Map<dynamic, dynamic> json) {
  final IndexDataBackTips indexDataBackTips = IndexDataBackTips();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    indexDataBackTips.id = id;
  }
  final String? aType = jsonConvert.convert<String>(json['a_type']);
  if (aType != null) {
    indexDataBackTips.aType = aType;
  }
  final String? bContent = jsonConvert.convert<String>(json['b_content']);
  if (bContent != null) {
    indexDataBackTips.bContent = bContent;
  }
  return indexDataBackTips;
}

Map<String, dynamic> $IndexDataBackTipsToJson(IndexDataBackTips entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_type'] = entity.aType;
  data['b_content'] = entity.bContent;
  return data;
}

extension IndexDataBackTipsExtension on IndexDataBackTips {
  IndexDataBackTips copyWith({
    int? id,
    String? aType,
    String? bContent,
  }) {
    return IndexDataBackTips()
      ..id = id ?? this.id
      ..aType = aType ?? this.aType
      ..bContent = bContent ?? this.bContent;
  }
}