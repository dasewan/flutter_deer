// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:myapp9/generated/captcha_entity.dart';
import 'package:myapp9/generated/center_entity.dart';
import 'package:myapp9/generated/d_borrow_index_entity.dart';
import 'package:myapp9/generated/verification_code_entity.dart';
import 'package:myapp9/models/a_user_entity.dart';
import 'package:myapp9/models/authorizations_store_entity.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/models/borrow_detail_entity.dart';
import 'package:myapp9/models/borrow_list_entity.dart';
import 'package:myapp9/models/d_borrow_sign_entity.dart';
import 'package:myapp9/models/d_borrow_store_entity.dart';
import 'package:myapp9/models/device_info_entity.dart';
import 'package:myapp9/models/g_verifies_show_entity.dart';
import 'package:myapp9/models/g_verify_entity.dart';
import 'package:myapp9/models/index_entity.dart';
import 'package:myapp9/models/index_first_entity.dart';
import 'package:myapp9/models/index_no_entity.dart';
import 'package:myapp9/models/n_user_profile_entity.dart';
import 'package:myapp9/models/q_a_ocr_entity.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';
import 'package:myapp9/models/sync_entity.dart';
import 'package:myapp9/models/verify_item_store_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);
extension MapSafeExt<K, V> on Map<K, V> {
  T? getOrNull<T>(K? key) {
    if (!containsKey(key) || key == null) {
      return null;
    } else {
      return this[key] as T?;
    }
  }
}

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value, {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(value as Map<String, dynamic>) as T;
      } else {
        throw UnimplementedError('$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<CaptchaEntity>[] is M) {
      return data.map<CaptchaEntity>((Map<String, dynamic> e) => CaptchaEntity.fromJson(e)).toList() as M;
    }
    if (<CenterEntity>[] is M) {
      return data.map<CenterEntity>((Map<String, dynamic> e) => CenterEntity.fromJson(e)).toList() as M;
    }
    if (<CenterData>[] is M) {
      return data.map<CenterData>((Map<String, dynamic> e) => CenterData.fromJson(e)).toList() as M;
    }
    if (<CenterDataAmountProgress>[] is M) {
      return data.map<CenterDataAmountProgress>((Map<String, dynamic> e) => CenterDataAmountProgress.fromJson(e)).toList() as M;
    }
    if (<CenterDataLevelProgress>[] is M) {
      return data.map<CenterDataLevelProgress>((Map<String, dynamic> e) => CenterDataLevelProgress.fromJson(e)).toList() as M;
    }
    if (<DBorrowIndexEntity>[] is M) {
      return data.map<DBorrowIndexEntity>((Map<String, dynamic> e) => DBorrowIndexEntity.fromJson(e)).toList() as M;
    }
    if (<DBorrowIndexData>[] is M) {
      return data.map<DBorrowIndexData>((Map<String, dynamic> e) => DBorrowIndexData.fromJson(e)).toList() as M;
    }
    if (<VerificationCodeEntity>[] is M) {
      return data.map<VerificationCodeEntity>((Map<String, dynamic> e) => VerificationCodeEntity.fromJson(e)).toList() as M;
    }
    if (<AUserEntity>[] is M) {
      return data.map<AUserEntity>((Map<String, dynamic> e) => AUserEntity.fromJson(e)).toList() as M;
    }
    if (<AuthorizationsStoreEntity>[] is M) {
      return data.map<AuthorizationsStoreEntity>((Map<String, dynamic> e) => AuthorizationsStoreEntity.fromJson(e)).toList() as M;
    }
    if (<AuthorizationsStorePassport>[] is M) {
      return data.map<AuthorizationsStorePassport>((Map<String, dynamic> e) => AuthorizationsStorePassport.fromJson(e)).toList() as M;
    }
    if (<BProductEntity>[] is M) {
      return data.map<BProductEntity>((Map<String, dynamic> e) => BProductEntity.fromJson(e)).toList() as M;
    }
    if (<BorrowDetailEntity>[] is M) {
      return data.map<BorrowDetailEntity>((Map<String, dynamic> e) => BorrowDetailEntity.fromJson(e)).toList() as M;
    }
    if (<BorrowDetailData>[] is M) {
      return data.map<BorrowDetailData>((Map<String, dynamic> e) => BorrowDetailData.fromJson(e)).toList() as M;
    }
    if (<BorrowDetailDataBorrow>[] is M) {
      return data.map<BorrowDetailDataBorrow>((Map<String, dynamic> e) => BorrowDetailDataBorrow.fromJson(e)).toList() as M;
    }
    if (<BorrowDetailDataPeriods>[] is M) {
      return data.map<BorrowDetailDataPeriods>((Map<String, dynamic> e) => BorrowDetailDataPeriods.fromJson(e)).toList() as M;
    }
    if (<BorrowDetailDataProduct>[] is M) {
      return data.map<BorrowDetailDataProduct>((Map<String, dynamic> e) => BorrowDetailDataProduct.fromJson(e)).toList() as M;
    }
    if (<BorrowDetailDataLoan>[] is M) {
      return data.map<BorrowDetailDataLoan>((Map<String, dynamic> e) => BorrowDetailDataLoan.fromJson(e)).toList() as M;
    }
    if (<BorrowListEntity>[] is M) {
      return data.map<BorrowListEntity>((Map<String, dynamic> e) => BorrowListEntity.fromJson(e)).toList() as M;
    }
    if (<BorrowListData>[] is M) {
      return data.map<BorrowListData>((Map<String, dynamic> e) => BorrowListData.fromJson(e)).toList() as M;
    }
    if (<BorrowListOther>[] is M) {
      return data.map<BorrowListOther>((Map<String, dynamic> e) => BorrowListOther.fromJson(e)).toList() as M;
    }
    if (<DBorrowSignEntity>[] is M) {
      return data.map<DBorrowSignEntity>((Map<String, dynamic> e) => DBorrowSignEntity.fromJson(e)).toList() as M;
    }
    if (<DBorrowSignData>[] is M) {
      return data.map<DBorrowSignData>((Map<String, dynamic> e) => DBorrowSignData.fromJson(e)).toList() as M;
    }
    if (<DBorrowSignDataPreComputeItem>[] is M) {
      return data.map<DBorrowSignDataPreComputeItem>((Map<String, dynamic> e) => DBorrowSignDataPreComputeItem.fromJson(e)).toList() as M;
    }
    if (<DBorrowStoreEntity>[] is M) {
      return data.map<DBorrowStoreEntity>((Map<String, dynamic> e) => DBorrowStoreEntity.fromJson(e)).toList() as M;
    }
    if (<DBorrowStoreData>[] is M) {
      return data.map<DBorrowStoreData>((Map<String, dynamic> e) => DBorrowStoreData.fromJson(e)).toList() as M;
    }
    if (<DeviceInfoEntity>[] is M) {
      return data.map<DeviceInfoEntity>((Map<String, dynamic> e) => DeviceInfoEntity.fromJson(e)).toList() as M;
    }
    if (<GVerifiesShowEntity>[] is M) {
      return data.map<GVerifiesShowEntity>((Map<String, dynamic> e) => GVerifiesShowEntity.fromJson(e)).toList() as M;
    }
    if (<GVerifiesShowData>[] is M) {
      return data.map<GVerifiesShowData>((Map<String, dynamic> e) => GVerifiesShowData.fromJson(e)).toList() as M;
    }
    if (<GVerifyEntity>[] is M) {
      return data.map<GVerifyEntity>((Map<String, dynamic> e) => GVerifyEntity.fromJson(e)).toList() as M;
    }
    if (<IndexEntity>[] is M) {
      return data.map<IndexEntity>((Map<String, dynamic> e) => IndexEntity.fromJson(e)).toList() as M;
    }
    if (<IndexData>[] is M) {
      return data.map<IndexData>((Map<String, dynamic> e) => IndexData.fromJson(e)).toList() as M;
    }
    if (<IndexDataAUser>[] is M) {
      return data.map<IndexDataAUser>((Map<String, dynamic> e) => IndexDataAUser.fromJson(e)).toList() as M;
    }
    if (<IndexDataBProducts>[] is M) {
      return data.map<IndexDataBProducts>((Map<String, dynamic> e) => IndexDataBProducts.fromJson(e)).toList() as M;
    }
    if (<IndexDataBCProductFeatures>[] is M) {
      return data.map<IndexDataBCProductFeatures>((Map<String, dynamic> e) => IndexDataBCProductFeatures.fromJson(e)).toList() as M;
    }
    if (<IndexDataDBorrows>[] is M) {
      return data.map<IndexDataDBorrows>((Map<String, dynamic> e) => IndexDataDBorrows.fromJson(e)).toList() as M;
    }
    if (<IndexDataRFNotifications>[] is M) {
      return data.map<IndexDataRFNotifications>((Map<String, dynamic> e) => IndexDataRFNotifications.fromJson(e)).toList() as M;
    }
    if (<IndexDataQDBanners>[] is M) {
      return data.map<IndexDataQDBanners>((Map<String, dynamic> e) => IndexDataQDBanners.fromJson(e)).toList() as M;
    }
    if (<IndexDataRemind>[] is M) {
      return data.map<IndexDataRemind>((Map<String, dynamic> e) => IndexDataRemind.fromJson(e)).toList() as M;
    }
    if (<IndexDataBackTips>[] is M) {
      return data.map<IndexDataBackTips>((Map<String, dynamic> e) => IndexDataBackTips.fromJson(e)).toList() as M;
    }
    if (<IndexFirstEntity>[] is M) {
      return data.map<IndexFirstEntity>((Map<String, dynamic> e) => IndexFirstEntity.fromJson(e)).toList() as M;
    }
    if (<IndexFirstData>[] is M) {
      return data.map<IndexFirstData>((Map<String, dynamic> e) => IndexFirstData.fromJson(e)).toList() as M;
    }
    if (<IndexNoEntity>[] is M) {
      return data.map<IndexNoEntity>((Map<String, dynamic> e) => IndexNoEntity.fromJson(e)).toList() as M;
    }
    if (<IndexNoData>[] is M) {
      return data.map<IndexNoData>((Map<String, dynamic> e) => IndexNoData.fromJson(e)).toList() as M;
    }
    if (<NUserProfileEntity>[] is M) {
      return data.map<NUserProfileEntity>((Map<String, dynamic> e) => NUserProfileEntity.fromJson(e)).toList() as M;
    }
    if (<NUserProfileData>[] is M) {
      return data.map<NUserProfileData>((Map<String, dynamic> e) => NUserProfileData.fromJson(e)).toList() as M;
    }
    if (<NUserProfileOther>[] is M) {
      return data.map<NUserProfileOther>((Map<String, dynamic> e) => NUserProfileOther.fromJson(e)).toList() as M;
    }
    if (<QAOcrEntity>[] is M) {
      return data.map<QAOcrEntity>((Map<String, dynamic> e) => QAOcrEntity.fromJson(e)).toList() as M;
    }
    if (<QAOcrData>[] is M) {
      return data.map<QAOcrData>((Map<String, dynamic> e) => QAOcrData.fromJson(e)).toList() as M;
    }
    if (<QAOcrDataOcrResult>[] is M) {
      return data.map<QAOcrDataOcrResult>((Map<String, dynamic> e) => QAOcrDataOcrResult.fromJson(e)).toList() as M;
    }
    if (<QVerifyItemEntity>[] is M) {
      return data.map<QVerifyItemEntity>((Map<String, dynamic> e) => QVerifyItemEntity.fromJson(e)).toList() as M;
    }
    if (<SyncEntity>[] is M) {
      return data.map<SyncEntity>((Map<String, dynamic> e) => SyncEntity.fromJson(e)).toList() as M;
    }
    if (<VerifyItemStoreEntity>[] is M) {
      return data.map<VerifyItemStoreEntity>((Map<String, dynamic> e) => VerifyItemStoreEntity.fromJson(e)).toList() as M;
    }
    if (<VerifyItemStoreData>[] is M) {
      return data.map<VerifyItemStoreData>((Map<String, dynamic> e) => VerifyItemStoreData.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (CaptchaEntity).toString(): CaptchaEntity.fromJson,
    (CenterEntity).toString(): CenterEntity.fromJson,
    (CenterData).toString(): CenterData.fromJson,
    (CenterDataAmountProgress).toString(): CenterDataAmountProgress.fromJson,
    (CenterDataLevelProgress).toString(): CenterDataLevelProgress.fromJson,
    (DBorrowIndexEntity).toString(): DBorrowIndexEntity.fromJson,
    (DBorrowIndexData).toString(): DBorrowIndexData.fromJson,
    (VerificationCodeEntity).toString(): VerificationCodeEntity.fromJson,
    (AUserEntity).toString(): AUserEntity.fromJson,
    (AuthorizationsStoreEntity).toString(): AuthorizationsStoreEntity.fromJson,
    (AuthorizationsStorePassport).toString(): AuthorizationsStorePassport.fromJson,
    (BProductEntity).toString(): BProductEntity.fromJson,
    (BorrowDetailEntity).toString(): BorrowDetailEntity.fromJson,
    (BorrowDetailData).toString(): BorrowDetailData.fromJson,
    (BorrowDetailDataBorrow).toString(): BorrowDetailDataBorrow.fromJson,
    (BorrowDetailDataPeriods).toString(): BorrowDetailDataPeriods.fromJson,
    (BorrowDetailDataProduct).toString(): BorrowDetailDataProduct.fromJson,
    (BorrowDetailDataLoan).toString(): BorrowDetailDataLoan.fromJson,
    (BorrowListEntity).toString(): BorrowListEntity.fromJson,
    (BorrowListData).toString(): BorrowListData.fromJson,
    (BorrowListOther).toString(): BorrowListOther.fromJson,
    (DBorrowSignEntity).toString(): DBorrowSignEntity.fromJson,
    (DBorrowSignData).toString(): DBorrowSignData.fromJson,
    (DBorrowSignDataPreComputeItem).toString(): DBorrowSignDataPreComputeItem.fromJson,
    (DBorrowStoreEntity).toString(): DBorrowStoreEntity.fromJson,
    (DBorrowStoreData).toString(): DBorrowStoreData.fromJson,
    (DeviceInfoEntity).toString(): DeviceInfoEntity.fromJson,
    (GVerifiesShowEntity).toString(): GVerifiesShowEntity.fromJson,
    (GVerifiesShowData).toString(): GVerifiesShowData.fromJson,
    (GVerifyEntity).toString(): GVerifyEntity.fromJson,
    (IndexEntity).toString(): IndexEntity.fromJson,
    (IndexData).toString(): IndexData.fromJson,
    (IndexDataAUser).toString(): IndexDataAUser.fromJson,
    (IndexDataBProducts).toString(): IndexDataBProducts.fromJson,
    (IndexDataBCProductFeatures).toString(): IndexDataBCProductFeatures.fromJson,
    (IndexDataDBorrows).toString(): IndexDataDBorrows.fromJson,
    (IndexDataRFNotifications).toString(): IndexDataRFNotifications.fromJson,
    (IndexDataQDBanners).toString(): IndexDataQDBanners.fromJson,
    (IndexDataRemind).toString(): IndexDataRemind.fromJson,
    (IndexDataBackTips).toString(): IndexDataBackTips.fromJson,
    (IndexFirstEntity).toString(): IndexFirstEntity.fromJson,
    (IndexFirstData).toString(): IndexFirstData.fromJson,
    (IndexNoEntity).toString(): IndexNoEntity.fromJson,
    (IndexNoData).toString(): IndexNoData.fromJson,
    (NUserProfileEntity).toString(): NUserProfileEntity.fromJson,
    (NUserProfileData).toString(): NUserProfileData.fromJson,
    (NUserProfileOther).toString(): NUserProfileOther.fromJson,
    (QAOcrEntity).toString(): QAOcrEntity.fromJson,
    (QAOcrData).toString(): QAOcrData.fromJson,
    (QAOcrDataOcrResult).toString(): QAOcrDataOcrResult.fromJson,
    (QVerifyItemEntity).toString(): QVerifyItemEntity.fromJson,
    (SyncEntity).toString(): SyncEntity.fromJson,
    (VerifyItemStoreEntity).toString(): VerifyItemStoreEntity.fromJson,
    (VerifyItemStoreData).toString(): VerifyItemStoreData.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}