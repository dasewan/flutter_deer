import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/sync_entity.dart';

SyncEntity $SyncEntityFromJson(Map<String, dynamic> json) {
  final SyncEntity syncEntity = SyncEntity();
  final int? lastSmsTime = jsonConvert.convert<int>(json['last_sms_time']);
  if (lastSmsTime != null) {
    syncEntity.lastSmsTime = lastSmsTime;
  }
  final int? lastAppInstallTime = jsonConvert.convert<int>(json['last_app_install_time']);
  if (lastAppInstallTime != null) {
    syncEntity.lastAppInstallTime = lastAppInstallTime;
  }
  final int? lastCallTime = jsonConvert.convert<int>(json['last_call_time']);
  if (lastCallTime != null) {
    syncEntity.lastCallTime = lastCallTime;
  }
  final int? lastBattery = jsonConvert.convert<int>(json['last_battery']);
  if (lastBattery != null) {
    syncEntity.lastBattery = lastBattery;
  }
  final int? lastDevice = jsonConvert.convert<int>(json['last_device']);
  if (lastDevice != null) {
    syncEntity.lastDevice = lastDevice;
  }
  final int? verifyDataUpdateTime = jsonConvert.convert<int>(json['verify_data_update_time']);
  if (verifyDataUpdateTime != null) {
    syncEntity.verifyDataUpdateTime = verifyDataUpdateTime;
  }
  return syncEntity;
}

Map<String, dynamic> $SyncEntityToJson(SyncEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['last_sms_time'] = entity.lastSmsTime;
  data['last_app_install_time'] = entity.lastAppInstallTime;
  data['last_call_time'] = entity.lastCallTime;
  data['last_battery'] = entity.lastBattery;
  data['last_device'] = entity.lastDevice;
  data['verify_data_update_time'] = entity.verifyDataUpdateTime;
  return data;
}

extension SyncEntityExtension on SyncEntity {
  SyncEntity copyWith({
    int? lastSmsTime,
    int? lastAppInstallTime,
    int? lastCallTime,
    int? lastBattery,
    int? lastDevice,
    int? verifyDataUpdateTime,
  }) {
    return SyncEntity()
      ..lastSmsTime = lastSmsTime ?? this.lastSmsTime
      ..lastAppInstallTime = lastAppInstallTime ?? this.lastAppInstallTime
      ..lastCallTime = lastCallTime ?? this.lastCallTime
      ..lastBattery = lastBattery ?? this.lastBattery
      ..lastDevice = lastDevice ?? this.lastDevice
      ..verifyDataUpdateTime = verifyDataUpdateTime ?? this.verifyDataUpdateTime;
  }
}