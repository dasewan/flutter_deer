import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/device_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class DeviceInfoEntity {

	int? id;
	@JSONField(name: "a_user_id")
	int? aUserId;
	@JSONField(name: "b_borrow_id")
	int? bBorrowId;
	@JSONField(name: "c_device_id")
	int? cDeviceId;
	@JSONField(name: "d_device")
	String? dDevice;
	@JSONField(name: "e_n_max_md5")
	String? eNMaxMd5;
	@JSONField(name: "f_o_index")
	String? fOIndex;
	@JSONField(name: "g_p_index")
	String? gPIndex;
	@JSONField(name: "h_q_user_ids")
	String? hQUserIds;
	@JSONField(name: "i_r_user_ids")
	String? iRUserIds;
	String? version;
	String? board;
	String? bootloader;
	String? brand;
	String? device;
	String? display;
	String? fingerprint;
	String? hardware;
	String? host;
	String? id2;
	String? manufacturer;
	String? model;
	String? product;
	String? type;
	String? isPhysicalDevice;
	String? serialNumber;
	String? name;
	String? systemName;
	String? systemVersion;
	String? localizedModel;
	String? identifierForVendor;
	String? appCodeName;
	String? appName;
	String? appVersion;
	String? deviceMemory;
	String? language;
	String? languages;
	String? platform;
	String? productSub;
	String? userAgent;
	String? vendor;
	String? vendorSub;
	String? hardwareConcurrency;
	String? maxTouchPoints;
	String? deviceID;
	String? isRoot;
	@JSONField(name: "created_at")
	dynamic createdAt;
	@JSONField(name: "updated_at")
	dynamic updatedAt;
	@JSONField(name: "deleted_at")
	dynamic deletedAt;
  
  DeviceInfoEntity();

  factory DeviceInfoEntity.fromJson(Map<String, dynamic> json) => $DeviceInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $DeviceInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}