import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:intl/intl.dart';
import 'package:myapp9/config/constant.dart';
// import 'package:myapp9/generated/json/q_verify_item_entity_helper.dart';
import 'package:myapp9/generated/json/q_verify_item_entity.g.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/verify/iviews/id_card_i_mvp_view.dart';
import 'package:myapp9/pages/verify/presenters/id_card_page_presenter.dart';
import 'package:myapp9/pages/verify/process_timeline.dart';
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

import '../../res/raw/gaps.dart';
import '../../widgets/my_scroll_view2.dart';

/// design/6/index.html#artboard2
class IdCardPage extends StatefulWidget {
  const IdCardPage({Key? key, this.id, this.name}) : super(key: key);
  final String? id;
  final String? name;

  @override
  _IdCardPageState createState() => _IdCardPageState();
}

class _IdCardPageState extends State<IdCardPage> with BasePageMixin<IdCardPage, IdCardPagePresenter>, SingleTickerProviderStateMixin implements IdCardIMvpView {
  late IdCardPagePresenter _idCardPagePresenter;
  final List<QVerifyItemEntity>? _verifyItem = SpUtil.getObj<QVerifyItemEntity>(Constant.idnumberVerifyItem, (v) => $QVerifyItemEntityFromJson(v))!.children;
  final Map<String, String> _submittedField = {};
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  final GlobalKey _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();

    _verifyItem?.forEach((QVerifyItemEntity item) {
      _submittedField["${item.cCode}"] = "";
      if (item.cCode == 'm_idnumber' && widget.id != null) {
        _controllers["${item.cCode}"] = TextEditingController(text: widget.id);
      } else if (item.cCode == 'q_name1' && widget.name != null) {
        _controllers["${item.cCode}"] = TextEditingController(text: widget.name);
      } else {
        _controllers["${item.cCode}"] = TextEditingController();
      }

      _focusNodes["${item.cCode}"] = FocusNode();
    });
  }

  @override
  IdCardPagePresenter createPresenter() {
    _idCardPagePresenter = IdCardPagePresenter();
    return _idCardPagePresenter;
  }

  @override
  void onCreateSuccess(String route) {
    // NavigatorUtils.goBack(context);
    // NavigatorUtils.goBack(context);
    showToast("oncreateSuccess");
    NavigatorUtils.push(context, route, replace: true);
  }

  @override
  void onCreateRefuse(String message) {
    // NavigatorUtils.goBack(context);
    // NavigatorUtils.goBack(context);
    // showToast(message);
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
          centerTitle: '1',
        ),*/
        backgroundColor: Colors.indigoAccent[700],
        body: SafeArea(
          child: SliverDemoPage(
            appbar: ProcessTimelinePage(
              processIndex: 0,
            ),
            title: "Identity Information",
            child: MyScrollView(
              key: const Key('goods_edit_page'),
              color: Colors.white,
              // padding: const EdgeInsets.symmetric(vertical: 1.0),
              bottomButton: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0),
                child: Column(
                  children: [
                    MyButton(
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          // print((_formKey.currentState as FormState).validate());
                          // print(_submittedField);
                          //验证通过提交数据
                          _idCardPagePresenter.midnumbers(_submittedField, false);
                          // _idCardPagePresenter.midnumbers(_controllers, false);
                          _idCardPagePresenter.toString();
                        } else {
                          setState(() {
                            _autovalidateMode = AutovalidateMode.onUserInteraction;
                          });
                        }
                        // _idCardPagePresenter.midnumbers(_submittedField, false);
                        // // _idCardPagePresenter.midnumbers(_controllers, false);
                        // _idCardPagePresenter.toString();
                      },
                      text: Myapp9Localizations.of(context)!.next,
                    ),
                    Gaps.vGap5,
                    Text(Myapp9Localizations.of(context)!.verifyBtnTip, style: const TextStyle(color: Colors.brown, fontSize: 9.0)),
                  ],
                ),
              ),
              children: <Widget>[
                // const SizedBox(height: 80, child: ProcessTimelinePage(processIndex: 0,),),
                Form(
                    key: _formKey,
                    autovalidateMode: _autovalidateMode,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _verifyItem!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildItem(_verifyItem![index], context);
                        }))
              ],
            ),
          ),
        ));
  }

  Widget _buildItem(QVerifyItemEntity field, BuildContext ctx2) {
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
    String? value;
    if (field.cCode == 'm_idnumber') {
      value = widget.id;
    }
    if (field.cCode == 'q_name1') {
      value = widget.name;
    }
    switch (field.lType) {
      case "text":
      case "number":
        tmp3 = TextFieldItem(
            title: field.bName.nullSafe,
            hintText: field.pHintText.nullSafe,
            controller: _controllers["${field.cCode}"],
            value: value,
            validator: MultiValidator(validator),
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
          validator: MultiValidator(validator),
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
          validator: MultiValidator(validator),
          onTap: () {
            _showDatePicker(context, field.cCode, ctx2);
          },
        );
        break;
      case "picker":
        tmp3 = ClickItem2(
          title: field.bName.nullSafe,
          content: '2',
          controller: _controllers["${field.cCode}"],
          validator: MultiValidator(validator),
          onTap: () async {
            Result? a = await CityPickers.showCityPicker(
              context: context,
            );
            FocusScope.of(ctx2).requestFocus(FocusNode());
            _controllers[field.cCode]!.text = a!.areaName!;
            _submittedField["${field.cCode}"] = a.areaId!;
          },
        );

        break;
      default:
        tmp3 = TextFieldItem(
            title: field.bName.nullSafe,
            hintText: field.pHintText.nullSafe,
            controller: _controllers["${field.cCode}"],
            validator: MultiValidator(validator),
            onChanged: (v) {
              _submittedField["${field.cCode}"] = v;
            });
        break;
    }
    return Container(
      padding: const EdgeInsets.only(top: 2.0),
      child: tmp3,
    );
  }
}
