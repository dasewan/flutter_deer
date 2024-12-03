import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/device_info_entity.dart';

DeviceInfoEntity $DeviceInfoEntityFromJson(Map<String, dynamic> json) {
  final DeviceInfoEntity deviceInfoEntity = DeviceInfoEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    deviceInfoEntity.id = id;
  }
  final int? aUserId = jsonConvert.convert<int>(json['a_user_id']);
  if (aUserId != null) {
    deviceInfoEntity.aUserId = aUserId;
  }
  final int? bBorrowId = jsonConvert.convert<int>(json['b_borrow_id']);
  if (bBorrowId != null) {
    deviceInfoEntity.bBorrowId = bBorrowId;
  }
  final int? cDeviceId = jsonConvert.convert<int>(json['c_device_id']);
  if (cDeviceId != null) {
    deviceInfoEntity.cDeviceId = cDeviceId;
  }
  final String? dDevice = jsonConvert.convert<String>(json['d_device']);
  if (dDevice != null) {
    deviceInfoEntity.dDevice = dDevice;
  }
  final String? eNMaxMd5 = jsonConvert.convert<String>(json['e_n_max_md5']);
  if (eNMaxMd5 != null) {
    deviceInfoEntity.eNMaxMd5 = eNMaxMd5;
  }
  final String? fOIndex = jsonConvert.convert<String>(json['f_o_index']);
  if (fOIndex != null) {
    deviceInfoEntity.fOIndex = fOIndex;
  }
  final String? gPIndex = jsonConvert.convert<String>(json['g_p_index']);
  if (gPIndex != null) {
    deviceInfoEntity.gPIndex = gPIndex;
  }
  final String? hQUserIds = jsonConvert.convert<String>(json['h_q_user_ids']);
  if (hQUserIds != null) {
    deviceInfoEntity.hQUserIds = hQUserIds;
  }
  final String? iRUserIds = jsonConvert.convert<String>(json['i_r_user_ids']);
  if (iRUserIds != null) {
    deviceInfoEntity.iRUserIds = iRUserIds;
  }
  final String? version = jsonConvert.convert<String>(json['version']);
  if (version != null) {
    deviceInfoEntity.version = version;
  }
  final String? board = jsonConvert.convert<String>(json['board']);
  if (board != null) {
    deviceInfoEntity.board = board;
  }
  final String? bootloader = jsonConvert.convert<String>(json['bootloader']);
  if (bootloader != null) {
    deviceInfoEntity.bootloader = bootloader;
  }
  final String? brand = jsonConvert.convert<String>(json['brand']);
  if (brand != null) {
    deviceInfoEntity.brand = brand;
  }
  final String? device = jsonConvert.convert<String>(json['device']);
  if (device != null) {
    deviceInfoEntity.device = device;
  }
  final String? display = jsonConvert.convert<String>(json['display']);
  if (display != null) {
    deviceInfoEntity.display = display;
  }
  final String? fingerprint = jsonConvert.convert<String>(json['fingerprint']);
  if (fingerprint != null) {
    deviceInfoEntity.fingerprint = fingerprint;
  }
  final String? hardware = jsonConvert.convert<String>(json['hardware']);
  if (hardware != null) {
    deviceInfoEntity.hardware = hardware;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    deviceInfoEntity.host = host;
  }
  final String? id2 = jsonConvert.convert<String>(json['id2']);
  if (id2 != null) {
    deviceInfoEntity.id2 = id2;
  }
  final String? manufacturer = jsonConvert.convert<String>(json['manufacturer']);
  if (manufacturer != null) {
    deviceInfoEntity.manufacturer = manufacturer;
  }
  final String? model = jsonConvert.convert<String>(json['model']);
  if (model != null) {
    deviceInfoEntity.model = model;
  }
  final String? product = jsonConvert.convert<String>(json['product']);
  if (product != null) {
    deviceInfoEntity.product = product;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    deviceInfoEntity.type = type;
  }
  final String? isPhysicalDevice = jsonConvert.convert<String>(json['isPhysicalDevice']);
  if (isPhysicalDevice != null) {
    deviceInfoEntity.isPhysicalDevice = isPhysicalDevice;
  }
  final String? serialNumber = jsonConvert.convert<String>(json['serialNumber']);
  if (serialNumber != null) {
    deviceInfoEntity.serialNumber = serialNumber;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    deviceInfoEntity.name = name;
  }
  final String? systemName = jsonConvert.convert<String>(json['systemName']);
  if (systemName != null) {
    deviceInfoEntity.systemName = systemName;
  }
  final String? systemVersion = jsonConvert.convert<String>(json['systemVersion']);
  if (systemVersion != null) {
    deviceInfoEntity.systemVersion = systemVersion;
  }
  final String? localizedModel = jsonConvert.convert<String>(json['localizedModel']);
  if (localizedModel != null) {
    deviceInfoEntity.localizedModel = localizedModel;
  }
  final String? identifierForVendor = jsonConvert.convert<String>(json['identifierForVendor']);
  if (identifierForVendor != null) {
    deviceInfoEntity.identifierForVendor = identifierForVendor;
  }
  final String? appCodeName = jsonConvert.convert<String>(json['appCodeName']);
  if (appCodeName != null) {
    deviceInfoEntity.appCodeName = appCodeName;
  }
  final String? appName = jsonConvert.convert<String>(json['appName']);
  if (appName != null) {
    deviceInfoEntity.appName = appName;
  }
  final String? appVersion = jsonConvert.convert<String>(json['appVersion']);
  if (appVersion != null) {
    deviceInfoEntity.appVersion = appVersion;
  }
  final String? deviceMemory = jsonConvert.convert<String>(json['deviceMemory']);
  if (deviceMemory != null) {
    deviceInfoEntity.deviceMemory = deviceMemory;
  }
  final String? language = jsonConvert.convert<String>(json['language']);
  if (language != null) {
    deviceInfoEntity.language = language;
  }
  final String? languages = jsonConvert.convert<String>(json['languages']);
  if (languages != null) {
    deviceInfoEntity.languages = languages;
  }
  final String? platform = jsonConvert.convert<String>(json['platform']);
  if (platform != null) {
    deviceInfoEntity.platform = platform;
  }
  final String? productSub = jsonConvert.convert<String>(json['productSub']);
  if (productSub != null) {
    deviceInfoEntity.productSub = productSub;
  }
  final String? userAgent = jsonConvert.convert<String>(json['userAgent']);
  if (userAgent != null) {
    deviceInfoEntity.userAgent = userAgent;
  }
  final String? vendor = jsonConvert.convert<String>(json['vendor']);
  if (vendor != null) {
    deviceInfoEntity.vendor = vendor;
  }
  final String? vendorSub = jsonConvert.convert<String>(json['vendorSub']);
  if (vendorSub != null) {
    deviceInfoEntity.vendorSub = vendorSub;
  }
  final String? hardwareConcurrency = jsonConvert.convert<String>(json['hardwareConcurrency']);
  if (hardwareConcurrency != null) {
    deviceInfoEntity.hardwareConcurrency = hardwareConcurrency;
  }
  final String? maxTouchPoints = jsonConvert.convert<String>(json['maxTouchPoints']);
  if (maxTouchPoints != null) {
    deviceInfoEntity.maxTouchPoints = maxTouchPoints;
  }
  final String? deviceID = jsonConvert.convert<String>(json['deviceID']);
  if (deviceID != null) {
    deviceInfoEntity.deviceID = deviceID;
  }
  final String? isRoot = jsonConvert.convert<String>(json['isRoot']);
  if (isRoot != null) {
    deviceInfoEntity.isRoot = isRoot;
  }
  final dynamic createdAt = json['created_at'];
  if (createdAt != null) {
    deviceInfoEntity.createdAt = createdAt;
  }
  final dynamic updatedAt = json['updated_at'];
  if (updatedAt != null) {
    deviceInfoEntity.updatedAt = updatedAt;
  }
  final dynamic deletedAt = json['deleted_at'];
  if (deletedAt != null) {
    deviceInfoEntity.deletedAt = deletedAt;
  }
  return deviceInfoEntity;
}

Map<String, dynamic> $DeviceInfoEntityToJson(DeviceInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['a_user_id'] = entity.aUserId;
  data['b_borrow_id'] = entity.bBorrowId;
  data['c_device_id'] = entity.cDeviceId;
  data['d_device'] = entity.dDevice;
  data['e_n_max_md5'] = entity.eNMaxMd5;
  data['f_o_index'] = entity.fOIndex;
  data['g_p_index'] = entity.gPIndex;
  data['h_q_user_ids'] = entity.hQUserIds;
  data['i_r_user_ids'] = entity.iRUserIds;
  data['version'] = entity.version;
  data['board'] = entity.board;
  data['bootloader'] = entity.bootloader;
  data['brand'] = entity.brand;
  data['device'] = entity.device;
  data['display'] = entity.display;
  data['fingerprint'] = entity.fingerprint;
  data['hardware'] = entity.hardware;
  data['host'] = entity.host;
  data['id2'] = entity.id2;
  data['manufacturer'] = entity.manufacturer;
  data['model'] = entity.model;
  data['product'] = entity.product;
  data['type'] = entity.type;
  data['isPhysicalDevice'] = entity.isPhysicalDevice;
  data['serialNumber'] = entity.serialNumber;
  data['name'] = entity.name;
  data['systemName'] = entity.systemName;
  data['systemVersion'] = entity.systemVersion;
  data['localizedModel'] = entity.localizedModel;
  data['identifierForVendor'] = entity.identifierForVendor;
  data['appCodeName'] = entity.appCodeName;
  data['appName'] = entity.appName;
  data['appVersion'] = entity.appVersion;
  data['deviceMemory'] = entity.deviceMemory;
  data['language'] = entity.language;
  data['languages'] = entity.languages;
  data['platform'] = entity.platform;
  data['productSub'] = entity.productSub;
  data['userAgent'] = entity.userAgent;
  data['vendor'] = entity.vendor;
  data['vendorSub'] = entity.vendorSub;
  data['hardwareConcurrency'] = entity.hardwareConcurrency;
  data['maxTouchPoints'] = entity.maxTouchPoints;
  data['deviceID'] = entity.deviceID;
  data['isRoot'] = entity.isRoot;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['deleted_at'] = entity.deletedAt;
  return data;
}

extension DeviceInfoEntityExtension on DeviceInfoEntity {
  DeviceInfoEntity copyWith({
    int? id,
    int? aUserId,
    int? bBorrowId,
    int? cDeviceId,
    String? dDevice,
    String? eNMaxMd5,
    String? fOIndex,
    String? gPIndex,
    String? hQUserIds,
    String? iRUserIds,
    String? version,
    String? board,
    String? bootloader,
    String? brand,
    String? device,
    String? display,
    String? fingerprint,
    String? hardware,
    String? host,
    String? id2,
    String? manufacturer,
    String? model,
    String? product,
    String? type,
    String? isPhysicalDevice,
    String? serialNumber,
    String? name,
    String? systemName,
    String? systemVersion,
    String? localizedModel,
    String? identifierForVendor,
    String? appCodeName,
    String? appName,
    String? appVersion,
    String? deviceMemory,
    String? language,
    String? languages,
    String? platform,
    String? productSub,
    String? userAgent,
    String? vendor,
    String? vendorSub,
    String? hardwareConcurrency,
    String? maxTouchPoints,
    String? deviceID,
    String? isRoot,
    dynamic createdAt,
    dynamic updatedAt,
    dynamic deletedAt,
  }) {
    return DeviceInfoEntity()
      ..id = id ?? this.id
      ..aUserId = aUserId ?? this.aUserId
      ..bBorrowId = bBorrowId ?? this.bBorrowId
      ..cDeviceId = cDeviceId ?? this.cDeviceId
      ..dDevice = dDevice ?? this.dDevice
      ..eNMaxMd5 = eNMaxMd5 ?? this.eNMaxMd5
      ..fOIndex = fOIndex ?? this.fOIndex
      ..gPIndex = gPIndex ?? this.gPIndex
      ..hQUserIds = hQUserIds ?? this.hQUserIds
      ..iRUserIds = iRUserIds ?? this.iRUserIds
      ..version = version ?? this.version
      ..board = board ?? this.board
      ..bootloader = bootloader ?? this.bootloader
      ..brand = brand ?? this.brand
      ..device = device ?? this.device
      ..display = display ?? this.display
      ..fingerprint = fingerprint ?? this.fingerprint
      ..hardware = hardware ?? this.hardware
      ..host = host ?? this.host
      ..id2 = id2 ?? this.id2
      ..manufacturer = manufacturer ?? this.manufacturer
      ..model = model ?? this.model
      ..product = product ?? this.product
      ..type = type ?? this.type
      ..isPhysicalDevice = isPhysicalDevice ?? this.isPhysicalDevice
      ..serialNumber = serialNumber ?? this.serialNumber
      ..name = name ?? this.name
      ..systemName = systemName ?? this.systemName
      ..systemVersion = systemVersion ?? this.systemVersion
      ..localizedModel = localizedModel ?? this.localizedModel
      ..identifierForVendor = identifierForVendor ?? this.identifierForVendor
      ..appCodeName = appCodeName ?? this.appCodeName
      ..appName = appName ?? this.appName
      ..appVersion = appVersion ?? this.appVersion
      ..deviceMemory = deviceMemory ?? this.deviceMemory
      ..language = language ?? this.language
      ..languages = languages ?? this.languages
      ..platform = platform ?? this.platform
      ..productSub = productSub ?? this.productSub
      ..userAgent = userAgent ?? this.userAgent
      ..vendor = vendor ?? this.vendor
      ..vendorSub = vendorSub ?? this.vendorSub
      ..hardwareConcurrency = hardwareConcurrency ?? this.hardwareConcurrency
      ..maxTouchPoints = maxTouchPoints ?? this.maxTouchPoints
      ..deviceID = deviceID ?? this.deviceID
      ..isRoot = isRoot ?? this.isRoot
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..deletedAt = deletedAt ?? this.deletedAt;
  }
}