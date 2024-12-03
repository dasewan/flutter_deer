import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/n_user_profile_entity.dart';

NUserProfileEntity $NUserProfileEntityFromJson(Map<String, dynamic> json) {
  final NUserProfileEntity nUserProfileEntity = NUserProfileEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    nUserProfileEntity.success = success;
  }
  final NUserProfileData? data = jsonConvert.convert<NUserProfileData>(json['data']);
  if (data != null) {
    nUserProfileEntity.data = data;
  }
  final NUserProfileOther? other = jsonConvert.convert<NUserProfileOther>(json['other']);
  if (other != null) {
    nUserProfileEntity.other = other;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    nUserProfileEntity.message = message;
  }
  return nUserProfileEntity;
}

Map<String, dynamic> $NUserProfileEntityToJson(NUserProfileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['other'] = entity.other?.toJson();
  data['message'] = entity.message;
  return data;
}

extension NUserProfileEntityExtension on NUserProfileEntity {
  NUserProfileEntity copyWith({
    bool? success,
    NUserProfileData? data,
    NUserProfileOther? other,
    String? message,
  }) {
    return NUserProfileEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..other = other ?? this.other
      ..message = message ?? this.message;
  }
}

NUserProfileData $NUserProfileDataFromJson(Map<String, dynamic> json) {
  final NUserProfileData nUserProfileData = NUserProfileData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    nUserProfileData.id = id;
  }
  final int? aUserId = jsonConvert.convert<int>(json['a_user_id']);
  if (aUserId != null) {
    nUserProfileData.aUserId = aUserId;
  }
  final int? lAppVersion = jsonConvert.convert<int>(json['l_app_version']);
  if (lAppVersion != null) {
    nUserProfileData.lAppVersion = lAppVersion;
  }
  final int? mInitMsgCount = jsonConvert.convert<int>(json['m_init_msg_count']);
  if (mInitMsgCount != null) {
    nUserProfileData.mInitMsgCount = mInitMsgCount;
  }
  final String? nLastMsgTime = jsonConvert.convert<String>(json['n_last_msg_time']);
  if (nLastMsgTime != null) {
    nUserProfileData.nLastMsgTime = nLastMsgTime;
  }
  final int? oSmsCount = jsonConvert.convert<int>(json['o_sms_count']);
  if (oSmsCount != null) {
    nUserProfileData.oSmsCount = oSmsCount;
  }
  final int? pInitAlbumCount = jsonConvert.convert<int>(json['p_init_album_count']);
  if (pInitAlbumCount != null) {
    nUserProfileData.pInitAlbumCount = pInitAlbumCount;
  }
  final String? qLastAlbumTime = jsonConvert.convert<String>(json['q_last_album_time']);
  if (qLastAlbumTime != null) {
    nUserProfileData.qLastAlbumTime = qLastAlbumTime;
  }
  final int? rAlbumCount = jsonConvert.convert<int>(json['r_album_count']);
  if (rAlbumCount != null) {
    nUserProfileData.rAlbumCount = rAlbumCount;
  }
  final int? sInitAppCount = jsonConvert.convert<int>(json['s_init_app_count']);
  if (sInitAppCount != null) {
    nUserProfileData.sInitAppCount = sInitAppCount;
  }
  final String? tLastAppTime = jsonConvert.convert<String>(json['t_last_app_time']);
  if (tLastAppTime != null) {
    nUserProfileData.tLastAppTime = tLastAppTime;
  }
  final int? uAppCount = jsonConvert.convert<int>(json['u_app_count']);
  if (uAppCount != null) {
    nUserProfileData.uAppCount = uAppCount;
  }
  final int? vInitContactCount = jsonConvert.convert<int>(json['v_init_contact_count']);
  if (vInitContactCount != null) {
    nUserProfileData.vInitContactCount = vInitContactCount;
  }
  final String? wLastContactTime = jsonConvert.convert<String>(json['w_last_contact_time']);
  if (wLastContactTime != null) {
    nUserProfileData.wLastContactTime = wLastContactTime;
  }
  final int? xContactCount = jsonConvert.convert<int>(json['x_contact_count']);
  if (xContactCount != null) {
    nUserProfileData.xContactCount = xContactCount;
  }
  final String? yLastDeviceTime = jsonConvert.convert<String>(json['y_last_device_time']);
  if (yLastDeviceTime != null) {
    nUserProfileData.yLastDeviceTime = yLastDeviceTime;
  }
  return nUserProfileData;
}

Map<String, dynamic> $NUserProfileDataToJson(NUserProfileData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_user_id'] = entity.aUserId;
  data['l_app_version'] = entity.lAppVersion;
  data['m_init_msg_count'] = entity.mInitMsgCount;
  data['n_last_msg_time'] = entity.nLastMsgTime;
  data['o_sms_count'] = entity.oSmsCount;
  data['p_init_album_count'] = entity.pInitAlbumCount;
  data['q_last_album_time'] = entity.qLastAlbumTime;
  data['r_album_count'] = entity.rAlbumCount;
  data['s_init_app_count'] = entity.sInitAppCount;
  data['t_last_app_time'] = entity.tLastAppTime;
  data['u_app_count'] = entity.uAppCount;
  data['v_init_contact_count'] = entity.vInitContactCount;
  data['w_last_contact_time'] = entity.wLastContactTime;
  data['x_contact_count'] = entity.xContactCount;
  data['y_last_device_time'] = entity.yLastDeviceTime;
  return data;
}

extension NUserProfileDataExtension on NUserProfileData {
  NUserProfileData copyWith({
    int? id,
    int? aUserId,
    int? lAppVersion,
    int? mInitMsgCount,
    String? nLastMsgTime,
    int? oSmsCount,
    int? pInitAlbumCount,
    String? qLastAlbumTime,
    int? rAlbumCount,
    int? sInitAppCount,
    String? tLastAppTime,
    int? uAppCount,
    int? vInitContactCount,
    String? wLastContactTime,
    int? xContactCount,
    String? yLastDeviceTime,
  }) {
    return NUserProfileData()
      ..id = id ?? this.id
      ..aUserId = aUserId ?? this.aUserId
      ..lAppVersion = lAppVersion ?? this.lAppVersion
      ..mInitMsgCount = mInitMsgCount ?? this.mInitMsgCount
      ..nLastMsgTime = nLastMsgTime ?? this.nLastMsgTime
      ..oSmsCount = oSmsCount ?? this.oSmsCount
      ..pInitAlbumCount = pInitAlbumCount ?? this.pInitAlbumCount
      ..qLastAlbumTime = qLastAlbumTime ?? this.qLastAlbumTime
      ..rAlbumCount = rAlbumCount ?? this.rAlbumCount
      ..sInitAppCount = sInitAppCount ?? this.sInitAppCount
      ..tLastAppTime = tLastAppTime ?? this.tLastAppTime
      ..uAppCount = uAppCount ?? this.uAppCount
      ..vInitContactCount = vInitContactCount ?? this.vInitContactCount
      ..wLastContactTime = wLastContactTime ?? this.wLastContactTime
      ..xContactCount = xContactCount ?? this.xContactCount
      ..yLastDeviceTime = yLastDeviceTime ?? this.yLastDeviceTime;
  }
}

NUserProfileOther $NUserProfileOtherFromJson(Map<String, dynamic> json) {
  final NUserProfileOther nUserProfileOther = NUserProfileOther();
  final String? tip1 = jsonConvert.convert<String>(json['tip1']);
  if (tip1 != null) {
    nUserProfileOther.tip1 = tip1;
  }
  final String? tip2 = jsonConvert.convert<String>(json['tip2']);
  if (tip2 != null) {
    nUserProfileOther.tip2 = tip2;
  }
  final String? tip3 = jsonConvert.convert<String>(json['tip3']);
  if (tip3 != null) {
    nUserProfileOther.tip3 = tip3;
  }
  final String? tip4 = jsonConvert.convert<String>(json['tip4']);
  if (tip4 != null) {
    nUserProfileOther.tip4 = tip4;
  }
  return nUserProfileOther;
}

Map<String, dynamic> $NUserProfileOtherToJson(NUserProfileOther entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tip1'] = entity.tip1;
  data['tip2'] = entity.tip2;
  data['tip3'] = entity.tip3;
  data['tip4'] = entity.tip4;
  return data;
}

extension NUserProfileOtherExtension on NUserProfileOther {
  NUserProfileOther copyWith({
    String? tip1,
    String? tip2,
    String? tip3,
    String? tip4,
  }) {
    return NUserProfileOther()
      ..tip1 = tip1 ?? this.tip1
      ..tip2 = tip2 ?? this.tip2
      ..tip3 = tip3 ?? this.tip3
      ..tip4 = tip4 ?? this.tip4;
  }
}
