import 'package:myapp9/generated/json/sync_entity.g.dart';

import 'package:myapp9/generated/json/base/json_field.dart';

@JsonSerializable()
class SyncEntity {

	SyncEntity();

	factory SyncEntity.fromJson(Map<String, dynamic> json) => $SyncEntityFromJson(json);

	Map<String, dynamic> toJson() => $SyncEntityToJson(this);

	@JSONField(name: "last_sms_time")
	int? lastSmsTime;
	@JSONField(name: "last_app_install_time")
	int? lastAppInstallTime;
	@JSONField(name: "last_call_time")
	int? lastCallTime;
	@JSONField(name: "last_battery")
	int? lastBattery;
	@JSONField(name: "last_device")
	int? lastDevice;
	@JSONField(name: "verify_data_update_time")
	int? verifyDataUpdateTime;
}
