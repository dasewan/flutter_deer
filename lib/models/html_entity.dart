import 'package:myapp9/generated/json/base/json_field.dart';
import 'package:myapp9/generated/json/html_entity.g.dart';
import 'dart:convert';
export 'package:myapp9/generated/json/html_entity.g.dart';

@JsonSerializable()
class HtmlEntity {
	bool? success = false;
	HtmlData? data;
	List<dynamic>? other = [];
	String? message = '';

	HtmlEntity();

	factory HtmlEntity.fromJson(Map<String, dynamic> json) => $HtmlEntityFromJson(json);

	Map<String, dynamic> toJson() => $HtmlEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlData {
	HtmlDataCredit? credit;
	HtmlDataAbout? about;
	HtmlDataHelp? help;
	HtmlDataPrivacy? privacy;

	HtmlData();

	factory HtmlData.fromJson(Map<String, dynamic> json) => $HtmlDataFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataCredit {
	String? title = '';
	List<HtmlDataCreditList>? list = [];

	HtmlDataCredit();

	factory HtmlDataCredit.fromJson(Map<String, dynamic> json) => $HtmlDataCreditFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataCreditToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataCreditList {
	String? title = '';
	String? img = '';
	String? content = '';

	HtmlDataCreditList();

	factory HtmlDataCreditList.fromJson(Map<String, dynamic> json) => $HtmlDataCreditListFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataCreditListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataAbout {
	String? title = '';
	List<HtmlDataAboutList>? list = [];

	HtmlDataAbout();

	factory HtmlDataAbout.fromJson(Map<String, dynamic> json) => $HtmlDataAboutFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataAboutToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataAboutList {
	String? title = '';
	String? img = '';
	String? content = '';

	HtmlDataAboutList();

	factory HtmlDataAboutList.fromJson(Map<String, dynamic> json) => $HtmlDataAboutListFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataAboutListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataHelp {
	String? title = '';
	List<HtmlDataHelpList>? list = [];

	HtmlDataHelp();

	factory HtmlDataHelp.fromJson(Map<String, dynamic> json) => $HtmlDataHelpFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataHelpToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataHelpList {
	String? q = '';
	String? a = '';

	HtmlDataHelpList();

	factory HtmlDataHelpList.fromJson(Map<String, dynamic> json) => $HtmlDataHelpListFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataHelpListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataPrivacy {
	String? title = '';
	List<HtmlDataPrivacyList>? list = [];

	HtmlDataPrivacy();

	factory HtmlDataPrivacy.fromJson(Map<String, dynamic> json) => $HtmlDataPrivacyFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataPrivacyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class HtmlDataPrivacyList {
	String? title = '';
	String? img = '';
	String? content = '';

	HtmlDataPrivacyList();

	factory HtmlDataPrivacyList.fromJson(Map<String, dynamic> json) => $HtmlDataPrivacyListFromJson(json);

	Map<String, dynamic> toJson() => $HtmlDataPrivacyListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}