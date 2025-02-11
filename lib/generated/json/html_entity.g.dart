import 'package:myapp9/generated/json/base/json_convert_content.dart';
import 'package:myapp9/models/html_entity.dart';

HtmlEntity $HtmlEntityFromJson(Map<String, dynamic> json) {
  final HtmlEntity htmlEntity = HtmlEntity();
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    htmlEntity.success = success;
  }
  final HtmlData? data = jsonConvert.convert<HtmlData>(json['data']);
  if (data != null) {
    htmlEntity.data = data;
  }
  final List<dynamic>? other = (json['other'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (other != null) {
    htmlEntity.other = other;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    htmlEntity.message = message;
  }
  return htmlEntity;
}

Map<String, dynamic> $HtmlEntityToJson(HtmlEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['success'] = entity.success;
  data['data'] = entity.data?.toJson();
  data['other'] = entity.other;
  data['message'] = entity.message;
  return data;
}

extension HtmlEntityExtension on HtmlEntity {
  HtmlEntity copyWith({
    bool? success,
    HtmlData? data,
    List<dynamic>? other,
    String? message,
  }) {
    return HtmlEntity()
      ..success = success ?? this.success
      ..data = data ?? this.data
      ..other = other ?? this.other
      ..message = message ?? this.message;
  }
}

HtmlData $HtmlDataFromJson(Map<String, dynamic> json) {
  final HtmlData htmlData = HtmlData();
  final HtmlDataCredit? credit = jsonConvert.convert<HtmlDataCredit>(
      json['credit']);
  if (credit != null) {
    htmlData.credit = credit;
  }
  final HtmlDataAbout? about = jsonConvert.convert<HtmlDataAbout>(
      json['about']);
  if (about != null) {
    htmlData.about = about;
  }
  final HtmlDataHelp? help = jsonConvert.convert<HtmlDataHelp>(json['help']);
  if (help != null) {
    htmlData.help = help;
  }
  final HtmlDataPrivacy? privacy = jsonConvert.convert<HtmlDataPrivacy>(
      json['privacy']);
  if (privacy != null) {
    htmlData.privacy = privacy;
  }
  return htmlData;
}

Map<String, dynamic> $HtmlDataToJson(HtmlData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['credit'] = entity.credit?.toJson();
  data['about'] = entity.about?.toJson();
  data['help'] = entity.help?.toJson();
  data['privacy'] = entity.privacy?.toJson();
  return data;
}

extension HtmlDataExtension on HtmlData {
  HtmlData copyWith({
    HtmlDataCredit? credit,
    HtmlDataAbout? about,
    HtmlDataHelp? help,
    HtmlDataPrivacy? privacy,
  }) {
    return HtmlData()
      ..credit = credit ?? this.credit
      ..about = about ?? this.about
      ..help = help ?? this.help
      ..privacy = privacy ?? this.privacy;
  }
}

HtmlDataCredit $HtmlDataCreditFromJson(Map<String, dynamic> json) {
  final HtmlDataCredit htmlDataCredit = HtmlDataCredit();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    htmlDataCredit.title = title;
  }
  final List<HtmlDataCreditList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<HtmlDataCreditList>(e) as HtmlDataCreditList)
      .toList();
  if (list != null) {
    htmlDataCredit.list = list;
  }
  return htmlDataCredit;
}

Map<String, dynamic> $HtmlDataCreditToJson(HtmlDataCredit entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension HtmlDataCreditExtension on HtmlDataCredit {
  HtmlDataCredit copyWith({
    String? title,
    List<HtmlDataCreditList>? list,
  }) {
    return HtmlDataCredit()
      ..title = title ?? this.title
      ..list = list ?? this.list;
  }
}

HtmlDataCreditList $HtmlDataCreditListFromJson(Map<String, dynamic> json) {
  final HtmlDataCreditList htmlDataCreditList = HtmlDataCreditList();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    htmlDataCreditList.title = title;
  }
  final String? img = jsonConvert.convert<String>(json['img']);
  if (img != null) {
    htmlDataCreditList.img = img;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    htmlDataCreditList.content = content;
  }
  return htmlDataCreditList;
}

Map<String, dynamic> $HtmlDataCreditListToJson(HtmlDataCreditList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['img'] = entity.img;
  data['content'] = entity.content;
  return data;
}

extension HtmlDataCreditListExtension on HtmlDataCreditList {
  HtmlDataCreditList copyWith({
    String? title,
    String? img,
    String? content,
  }) {
    return HtmlDataCreditList()
      ..title = title ?? this.title
      ..img = img ?? this.img
      ..content = content ?? this.content;
  }
}

HtmlDataAbout $HtmlDataAboutFromJson(Map<String, dynamic> json) {
  final HtmlDataAbout htmlDataAbout = HtmlDataAbout();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    htmlDataAbout.title = title;
  }
  final List<HtmlDataAboutList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<HtmlDataAboutList>(e) as HtmlDataAboutList)
      .toList();
  if (list != null) {
    htmlDataAbout.list = list;
  }
  return htmlDataAbout;
}

Map<String, dynamic> $HtmlDataAboutToJson(HtmlDataAbout entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension HtmlDataAboutExtension on HtmlDataAbout {
  HtmlDataAbout copyWith({
    String? title,
    List<HtmlDataAboutList>? list,
  }) {
    return HtmlDataAbout()
      ..title = title ?? this.title
      ..list = list ?? this.list;
  }
}

HtmlDataAboutList $HtmlDataAboutListFromJson(Map<String, dynamic> json) {
  final HtmlDataAboutList htmlDataAboutList = HtmlDataAboutList();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    htmlDataAboutList.title = title;
  }
  final String? img = jsonConvert.convert<String>(json['img']);
  if (img != null) {
    htmlDataAboutList.img = img;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    htmlDataAboutList.content = content;
  }
  return htmlDataAboutList;
}

Map<String, dynamic> $HtmlDataAboutListToJson(HtmlDataAboutList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['img'] = entity.img;
  data['content'] = entity.content;
  return data;
}

extension HtmlDataAboutListExtension on HtmlDataAboutList {
  HtmlDataAboutList copyWith({
    String? title,
    String? img,
    String? content,
  }) {
    return HtmlDataAboutList()
      ..title = title ?? this.title
      ..img = img ?? this.img
      ..content = content ?? this.content;
  }
}

HtmlDataHelp $HtmlDataHelpFromJson(Map<String, dynamic> json) {
  final HtmlDataHelp htmlDataHelp = HtmlDataHelp();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    htmlDataHelp.title = title;
  }
  final List<HtmlDataHelpList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<HtmlDataHelpList>(e) as HtmlDataHelpList)
      .toList();
  if (list != null) {
    htmlDataHelp.list = list;
  }
  return htmlDataHelp;
}

Map<String, dynamic> $HtmlDataHelpToJson(HtmlDataHelp entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension HtmlDataHelpExtension on HtmlDataHelp {
  HtmlDataHelp copyWith({
    String? title,
    List<HtmlDataHelpList>? list,
  }) {
    return HtmlDataHelp()
      ..title = title ?? this.title
      ..list = list ?? this.list;
  }
}

HtmlDataHelpList $HtmlDataHelpListFromJson(Map<String, dynamic> json) {
  final HtmlDataHelpList htmlDataHelpList = HtmlDataHelpList();
  final String? q = jsonConvert.convert<String>(json['q']);
  if (q != null) {
    htmlDataHelpList.q = q;
  }
  final String? a = jsonConvert.convert<String>(json['a']);
  if (a != null) {
    htmlDataHelpList.a = a;
  }
  return htmlDataHelpList;
}

Map<String, dynamic> $HtmlDataHelpListToJson(HtmlDataHelpList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['q'] = entity.q;
  data['a'] = entity.a;
  return data;
}

extension HtmlDataHelpListExtension on HtmlDataHelpList {
  HtmlDataHelpList copyWith({
    String? q,
    String? a,
  }) {
    return HtmlDataHelpList()
      ..q = q ?? this.q
      ..a = a ?? this.a;
  }
}

HtmlDataPrivacy $HtmlDataPrivacyFromJson(Map<String, dynamic> json) {
  final HtmlDataPrivacy htmlDataPrivacy = HtmlDataPrivacy();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    htmlDataPrivacy.title = title;
  }
  final List<HtmlDataPrivacyList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<HtmlDataPrivacyList>(e) as HtmlDataPrivacyList)
      .toList();
  if (list != null) {
    htmlDataPrivacy.list = list;
  }
  return htmlDataPrivacy;
}

Map<String, dynamic> $HtmlDataPrivacyToJson(HtmlDataPrivacy entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension HtmlDataPrivacyExtension on HtmlDataPrivacy {
  HtmlDataPrivacy copyWith({
    String? title,
    List<HtmlDataPrivacyList>? list,
  }) {
    return HtmlDataPrivacy()
      ..title = title ?? this.title
      ..list = list ?? this.list;
  }
}

HtmlDataPrivacyList $HtmlDataPrivacyListFromJson(Map<String, dynamic> json) {
  final HtmlDataPrivacyList htmlDataPrivacyList = HtmlDataPrivacyList();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    htmlDataPrivacyList.title = title;
  }
  final String? img = jsonConvert.convert<String>(json['img']);
  if (img != null) {
    htmlDataPrivacyList.img = img;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    htmlDataPrivacyList.content = content;
  }
  return htmlDataPrivacyList;
}

Map<String, dynamic> $HtmlDataPrivacyListToJson(HtmlDataPrivacyList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['img'] = entity.img;
  data['content'] = entity.content;
  return data;
}

extension HtmlDataPrivacyListExtension on HtmlDataPrivacyList {
  HtmlDataPrivacyList copyWith({
    String? title,
    String? img,
    String? content,
  }) {
    return HtmlDataPrivacyList()
      ..title = title ?? this.title
      ..img = img ?? this.img
      ..content = content ?? this.content;
  }
}