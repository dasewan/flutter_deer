import 'dart:async';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:intl/intl.dart';
import 'package:myapp9/config/constant.dart';
// import 'package:myapp9/generated/json/q_verify_item_entity_helper.dart';
import 'package:myapp9/generated/json/q_verify_item_entity.g.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/verify/iviews/contact_i_mvp_view.dart';
import 'package:myapp9/pages/verify/presenters/contact_page_presenter.dart';
import 'package:myapp9/pages/verify/process_timeline.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/formFieldValidator.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:myapp9/widgets/city_picker/city_pickers.dart';
import 'package:myapp9/widgets/click_item2.dart';
import 'package:myapp9/widgets/drop_down_widget.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';
import 'package:myapp9/widgets/text_field_item.dart';
import 'package:oktoast/oktoast.dart';

import '../../widgets/my_scroll_view2.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';

/// design/6/index.html#artboard2
class ContactPage extends StatefulWidget {
  const ContactPage({Key? key, this.id, this.name}) : super(key: key);
  final int? id;
  final String? name;

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with BasePageMixin<ContactPage, ContactPagePresenter>, SingleTickerProviderStateMixin
    implements ContactIMvpView {
  late ContactPagePresenter _contactPagePresenter;
  final List<QVerifyItemEntity>? _verifyItem = SpUtil.getObj<QVerifyItemEntity>(Constant.contactVerifyItem, (v) => $QVerifyItemEntityFromJson(v))!.children;
  final Map<String, String> _submittedField = {};
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  final GlobalKey _formKey = GlobalKey<FormState>();
  int _phoneIndex = 0;
  List<Contact?>? _phoneContactList;
  Contact? _phoneContact;
  Contact? _phoneContact2;
  Contact? _phoneContact3;
  static const platform = MethodChannel('samples.flutter.io/battery');
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler((call) async {
      switch (call.method) {
        case "requestPermission":
          print("****************");
          print(call.arguments["grantResults"].toString());
          // if (!call.arguments["grantResults"]) {
            // _showCupertinoDialog();
          // }
          break;
        default:
          break;
      }
    });
    _verifyItem?.forEach((QVerifyItemEntity item) {
      if (item.lType == 'group') {
        item.children?.forEach((QVerifyItemEntity _item) {
          _submittedField["${_item.cCode}"] = "";
          _controllers["${_item.cCode}"] = TextEditingController();
          _focusNodes["${_item.cCode}"] = FocusNode();
        });
      } else {
        _submittedField["${item.cCode}"] = "";
        _controllers["${item.cCode}"] = TextEditingController();
        _focusNodes["${item.cCode}"] = FocusNode();
      }
    });
  }

  @override
  ContactPagePresenter createPresenter() {
    _contactPagePresenter = ContactPagePresenter();
    return _contactPagePresenter;
  }

  @override
  void onCreateSuccess(String route) {
    // NavigatorUtils.goBack(context);
    // NavigatorUtils.goBack(context);
    showToast("oncreateSuccess");
    NavigatorUtils.push(context, route, replace: true);
  }

  @override
  Future<bool> requestOpsPermission() async {
    Map<String, dynamic> arguments = <String, dynamic>{
      'type': "sms",
    };
    final bool has3 = await platform.invokeMethod('checkOpsPermission', arguments) as bool;
    if (!has3) {
      showCupertinoDialogSub(title: Myapp9Localizations.of(context)!.smsPermissionTitle, content: Myapp9Localizations.of(context)!.smsPermissionContent);
    } else {
      return true;
    }
    return false;
  }

  Future<bool> checkOpsPermission() async {
    Map<String, dynamic> arguments = <String, dynamic>{
      'type': "sms",
    };
    final bool has3 = await platform.invokeMethod('checkOpsPermission', arguments) as bool;
    return has3;
  }


  void _showDatePicker(ctx, field, ctx2) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx as BuildContext,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                      // initialDateTime: DateTime.now(),
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          final DateFormat formatter = DateFormat('yyyy-MM-dd');
                          // _birthdayController.text = value.toString();
                          _controllers[field]!.text = formatter.format(value);
                          _submittedField[field as String] = formatter.format(value);
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () {
                      FocusScope.of(ctx2 as BuildContext).requestFocus(FocusNode());
                      return Navigator.of(ctx).pop();
                    },
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*        appBar: const MyAppBar(
          centerTitle: 'contact',
        ),*/
        backgroundColor: Colors.indigoAccent[700],
        body: SafeArea(
          child: SliverDemoPage(
            appbar: const ProcessTimelinePage(
              processIndex: 1,
            ),
            title: "Emergency Contacts",
            child: MyScrollView(
              key: const Key('goods_edit_page'),
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              bottomButton: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0),
                child: Column(
                  children: [
                    MyButton(
                      onPressed: () async {
                        if ((_formKey.currentState as FormState).validate()) {
                          // print((_formKey.currentState as FormState).validate());
                          // print(_submittedField);
                          bool hasSmsPermission = await checkOpsPermission();
                          if (hasSmsPermission) {
                            //验证通过提交数据
                            _contactPagePresenter.midnumbers(_submittedField, true);
                            // _contactPagePresenter.midnumbers(_controllers, false);
                            _contactPagePresenter.toString();
                          } else {
                            await requestOpsPermission();
                          }
                        } else {
                          setState(() {
                            _autovalidateMode = AutovalidateMode.onUserInteraction;
                          });
                        }
                        // _contactPagePresenter.midnumbers(_submittedField, false);
                        // // _contactPagePresenter.midnumbers(_controllers, false);
                        // _contactPagePresenter.toString();
                      },
                      text: Myapp9Localizations.of(context)!.next,
                    ),
                    Gaps.vGap5,
                    Text(Myapp9Localizations.of(context)!.verifyBtnTip, style: const TextStyle(color: Colors.brown, fontSize: 9.0)),
                  ],
                ),
              ),
              children: <Widget>[
                Form(
                    key: _formKey,
                    autovalidateMode: _autovalidateMode,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _verifyItem!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildItemP(_verifyItem![index], context, index: index);
                        }))
              ],
            ),
          ),
        ));
  }

  Widget _buildItemP(QVerifyItemEntity field, BuildContext ctx2, {int index = 0}) {
    if (field.lType != 'group') {
      return _buildItem(field, ctx2, id: field.id!);
    } else {
      return Column(
        children: [
          index == 0 ? Gaps.empty : Gaps.vGap24,
          Text(
            field.bName!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.vGap5,
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: field.children!.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(field.children![index], ctx2);
              }),
        ],
      );
    }
  }

  Widget _buildItem(QVerifyItemEntity field, BuildContext ctx2, {int id = 0}) {
    Key? _phoneNumber;
    if (id > 0) {
      _phoneNumber = Key("phone_number" + id.toString());
    }
    List<FieldValidator> validator = [];
    List<String>? validators = field.rMultiValidator?.split(",");
    if (validators != null) {
      List<List> validatorsDetails = [for (var e in validators) e.split(":")];
      for (List validatorOne in validatorsDetails) {
        String _errorText = validatorOne[1] as String;
        FieldValidator v = RequiredValidator(errorText: _errorText);
        switch (validatorOne[0]) {
          case "DateValidator":
            v = DateValidator(validatorOne[2] as String, errorText: _errorText);
            break;
          case "MatchValidator":
            break;
          case "PatternValidator":
            v = PatternValidator(validatorOne[2] as String, errorText: _errorText);
            break;
          case "EmailValidator":
            v = EmailValidator(errorText: _errorText);
            break;
          case "RangeValidator":
            v = RangeValidator(min: int.parse(validatorOne[2] as String), max: int.parse(validatorOne[3] as String), errorText: _errorText);
            break;
          case "LengthRangeValidator":
            v = LengthRangeValidator(min: int.parse(validatorOne[2] as String), max: int.parse(validatorOne[3] as String), errorText: _errorText);
            break;
          case "MinLengthValidator":
            v = MinLengthValidator(int.parse(validatorOne[2] as String), errorText: _errorText);
            break;
          case "MaxLengthValidator":
            v = MaxLengthValidator(int.parse(validatorOne[2] as String), errorText: _errorText);
            break;
          case "RequiredValidator":
            v = RequiredValidator(errorText: _errorText);
            break;
          case "StringValidator":
            v = StringValidator(min: int.parse(validatorOne[2] as String), max: int.parse(validatorOne[3] as String), errorText: _errorText);
            break;
          case "NumberValidator":
            v = NumberValidator(min: int.parse(validatorOne[2] as String), max: int.parse(validatorOne[3] as String), errorText: _errorText);
            break;
          default:
            v = RequiredValidator(errorText: _errorText);
            break;
        }
        validator.add(v);
      }
    }

    Widget tmp3;
    switch (field.lType) {
      case "text":
      case "number":
        tmp3 = TextFieldItem(
            title: field.bName.nullSafe,
            hintText: field.pHintText.nullSafe,
            controller: _controllers["${field.cCode}"],
            validator: validator,
            keyboardType: Constant.textInputTypeMap[field.mTextInputType.nullSafe]!,
            onChanged: (v) {
              _submittedField["${field.cCode}"] = v;
            });

        break;
      case "drop_down":
        List<String> list = field.tValues!.split(",");
        List<List> list2 = [for (var e in list) e.split(":")];
        tmp3 = ClickItem2(
          title: field.bName.nullSafe,
          hintText: field.pHintText.nullSafe,
          content: '2',
          controller: _controllers["${field.cCode}"],
          validator: validator,
          onTap: () {
            showElasticDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return DropDownWidget(
                  title: field.bName.nullSafe,
                  list: list2,
                  indexed: int.parse(_submittedField["${field.cCode}"] != '' ? _submittedField["${field.cCode}"].nullSafe : "0"),
                  onPressed: (i, value) {
                    _submittedField["${field.cCode}"] = i.toString();
                    _controllers["${field.cCode}"]!.text = value;
                    FocusScope.of(ctx2).requestFocus(FocusNode());
                  },
                );
              },
            );
          },
        );
        break;
      case "datetime":
        tmp3 = ClickItem2(
          title: field.bName.nullSafe,
          hintText: field.pHintText.nullSafe,
          content: '2',
          controller: _controllers["${field.cCode}"],
          validator: validator,
          onTap: () {
            // FocusScope.of(context).requestFocus(new FocusNode());
            _showDatePicker(context, field.cCode, ctx2);
          },
        );
        break;
      case "picker":
        tmp3 = ClickItem2(
          title: field.bName.nullSafe,
          content: '2',
          controller: _controllers["${field.cCode}"],
          validator: validator,
          onTap: () async {
            // FocusScope.of(context).requestFocus(new FocusNode());
            Result? a = await CityPickers.showCityPicker(
              context: context,
            );
            FocusScope.of(ctx2).requestFocus(FocusNode());
            _controllers[field.cCode]!.text = a!.areaName!;
            _submittedField["${field.cCode}"] = a.areaId!;
          },
        );

        break;
      case "phone":
        tmp3 = ClickItem2(
          title: field.bName.nullSafe,
          hintText: field.pHintText.nullSafe,
          content: '2',
          controller: _controllers["${field.cCode}"],
          validator: validator,
          onTap: () async {
            try {
              final FlutterNativeContactPicker _contactPicker = FlutterNativeContactPicker();
              Contact? contact = await _contactPicker.selectContact();
              _submittedField["${field.uGroupName}_name"] = contact?.fullName ?? '';
              _controllers["${field.uGroupName}_name"]!.text = contact?.fullName ?? '';
              _submittedField["${field.uGroupName}_phone"] = contact?.phoneNumbers?[0] ?? '';
              _controllers["${field.uGroupName}_phone"]!.text = contact?.phoneNumbers?[0] ?? '';
            } catch (e) {
              bool hasContactsPermission = await hasPermission('contacts');
              if (!hasContactsPermission) {
                showCupertinoDialogSub(title: "联系人权限", content: "请到系统设置，授权app读取联系人的权限");
              }
            }

            // _controllers["${field.uGroupName}_phone"]!.value = TextEditingValue(text:contact!.phoneNumber!.number!.toString());
          },
        );
        break;
      case "phone_sub":
        tmp3 = TextFieldItem(
          title: field.bName.nullSafe,
          hintText: field.pHintText.nullSafe,
          controller: _controllers["${field.cCode}"],
          validator: validator,
          readOnly: true,
          onChanged: (v) {
            _submittedField["${field.sOnSubmitted}"] = v;
          },
          onFieldSubmitted: (v) {
            _submittedField["${field.sOnSubmitted}"] = v;
          },
        );

        break;
      default:
        tmp3 = SizedBox.fromSize();
        break;
    }
    return Container(
      padding: const EdgeInsets.only(top: 2.0),
      height: 74,
      child: tmp3,
    );
  }
}
