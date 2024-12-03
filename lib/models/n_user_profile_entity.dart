import 'dart:convert';

import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/n_user_profile_entity.g.dart';

export 'package:myapp9/generated/json/n_user_profile_entity.g.dart';

@JsonSerializable()
class NUserProfileEntity {
  bool? success = false;
  NUserProfileData? data;
  NUserProfileOther? other;
  String? message = '';

  NUserProfileEntity();

  factory NUserProfileEntity.fromJson(Map<String, dynamic> json) => $NUserProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => $NUserProfileEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NUserProfileData {
  int? id = 0;
  @JSONField(name: "a_user_id")
  int? aUserId = 0;
  @JSONField(name: "l_app_version")
  int? lAppVersion = 0;
  @JSONField(name: "m_init_msg_count")
  int? mInitMsgCount = 0;
  @JSONField(name: "n_last_msg_time")
  String? nLastMsgTime = '';
  @JSONField(name: "o_sms_count")
  int? oSmsCount = 0;
  @JSONField(name: "p_init_album_count")
  int? pInitAlbumCount = 0;
  @JSONField(name: "q_last_album_time")
  String? qLastAlbumTime = '';
  @JSONField(name: "r_album_count")
  int? rAlbumCount = 0;
  @JSONField(name: "s_init_app_count")
  int? sInitAppCount = 0;
  @JSONField(name: "t_last_app_time")
  String? tLastAppTime = '';
  @JSONField(name: "u_app_count")
  int? uAppCount = 0;
  @JSONField(name: "v_init_contact_count")
  int? vInitContactCount = 0;
  @JSONField(name: "w_last_contact_time")
  String? wLastContactTime = '';
  @JSONField(name: "x_contact_count")
  int? xContactCount = 0;
  @JSONField(name: "y_last_device_time")
  String? yLastDeviceTime = '';

  NUserProfileData();

  factory NUserProfileData.fromJson(Map<String, dynamic> json) => $NUserProfileDataFromJson(json);

  Map<String, dynamic> toJson() => $NUserProfileDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NUserProfileOther {
  String? tip1 = '';
  String? tip2 = '';
  String? tip3 = '';
  String? tip4 = '';

  NUserProfileOther();

  factory NUserProfileOther.fromJson(Map<String, dynamic> json) => $NUserProfileOtherFromJson(json);

  Map<String, dynamic> toJson() => $NUserProfileOtherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
