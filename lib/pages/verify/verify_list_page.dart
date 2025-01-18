import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/models/q_verify_item_entity.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/verify/iviews/verify_list_i_mvp_view.dart';
import 'package:myapp9/pages/verify/presenters/verify_list_page_presenter.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/pages/verify/running_view.dart';
import 'package:myapp9/providers/verify_provider.dart';
import 'package:myapp9/res/raw/gaps.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';
import 'package:provider/provider.dart';

import 'fitness_app_theme.dart';

/// design/6/index.html#artboard2
class VerifiListPage extends StatefulWidget {
  const VerifiListPage({Key? key}) : super(key: key);

  @override
  _VerifiListPageState createState() => _VerifiListPageState();
}

class _VerifiListPageState extends State<VerifiListPage> with BasePageMixin<VerifiListPage, VerifyListPagePresenter> implements VerifyListIMvpView {
  late VerifyListPagePresenter _verifyListPagePresenter;
  late List<QVerifyItemEntity> _verifyItem;
  final Map<String, String> _routeMap = {
    Constant.idNumber: VerifyRouter.idCard,
    Constant.contact: VerifyRouter.contact,
    Constant.job: VerifyRouter.job,
    Constant.loanBank: VerifyRouter.loanBank,
    Constant.repayBank: VerifyRouter.repayBank
  };

  @override
  void initState() {
    _verifyItem = [];
    super.initState();
  }

  @override
  VerifyListPagePresenter createPresenter() {
    _verifyListPagePresenter = VerifyListPagePresenter();
    return _verifyListPagePresenter;
  }

  @override
  // VerifyListProvider get provider => throw UnimplementedError();
  VerifyProvider provider = VerifyProvider();

  @override
  // TODO: implement qVerifyItmeEntityList
  List<QVerifyItemEntity> qVerifyItmeEntityList = [];

  @override
  setQVerifyItemEntityList(List<QVerifyItemEntity> list){
    _verifyItem = list;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'Authentication',
        ),
        body: MyScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          bottomButton: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Selector<VerifyProvider, String>(
              selector: (_, provider) {
                return provider.updatedAt;
              },

              /// 精准判断刷新条件（provider 4.0新属性）
              shouldRebuild: (previous, next) => previous != next,
              builder: (_, status, __) {
                // 只会触发sortIndex变化的刷新
                return MyButton(
                  onPressed: () {
                    print(provider.jIdnumberVerifyStatus);
                    if (provider.jIdnumberVerifyStatus == Constant.notYet) {
                      NavigatorUtils.push(context, _routeMap[Constant.idNumber]!);
                    } else if (provider.nContactVerifyStatus == Constant.notYet) {
                      NavigatorUtils.push(context, _routeMap[Constant.contact]!);
                    } else if (provider.pJobVerifyStatus == Constant.notYet) {
                      NavigatorUtils.push(context, _routeMap[Constant.job]!);
                    } else if (provider.rLoanBankStatus == Constant.notYet) {
                      NavigatorUtils.push(context, _routeMap[Constant.loanBank]!);
                    }
                    // _idCardPagePresenter.midnumbers(_submittedField, false);
                    // // _idCardPagePresenter.midnumbers(_controllers, false);
                    // _idCardPagePresenter.toString();
                  },
                  text: 'CONTINUE',
                );
              },
            ),
          ),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    CupertinoIcons.exclamationmark_circle_fill,
                    color: Colors.red,
                    size: 16.0,
                  ),
                  Gaps.hGap5,
                  Expanded(
                    child: Text(
                      "During authentication, access to your contacts, SMS, and location will be required. Please grant the necessary permissions; otherwise, authentication cannot be completed.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: FitnessAppTheme.grey.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    CupertinoIcons.exclamationmark_circle_fill,
                    color: Colors.red,
                    size: 16.0,
                  ),
                  Gaps.hGap5,
                  Expanded(
                    child: Text(
                      "Please provide accurate information, as false details may impact your credit evaluation and loan amount.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: FitnessAppTheme.grey.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Gaps.vGap8,
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: _verifyItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(_verifyItem[index], index);
                }),
          ],
        ));
  }

  Widget _buildItem(QVerifyItemEntity verifyItem, int index) {
    return Selector<VerifyProvider, int>(
      selector: (_, provider) {
        switch (verifyItem.cCode) {
          case Constant.idNumber:
            return provider.jIdnumberVerifyStatus;
          case Constant.contact:
            return provider.nContactVerifyStatus;
          case Constant.loanBank:
            return provider.rLoanBankStatus;
          case Constant.repayBank:
            return provider.tRepayBankStatus;
          case Constant.job:
            return provider.pJobVerifyStatus;
          default:
            return provider.jIdnumberVerifyStatus;
        }
      },

      /// 精准判断刷新条件（provider 4.0新属性）
      shouldRebuild: (previous, next) => previous != next,
      builder: (_, status, __) {
        // 只会触发sortIndex变化的刷新
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: RunningView(
            title: verifyItem.bName!,
            status: status,
            subtitle: verifyItem.pHintText!,
            step: "0${index + 1}",
            // onTap: () => {showToast(verifyItem.value2.toString())},
            // onTap: () => NavigatorUtils.push(context, _routeMap[verifyItem.cCode]!),
            onTap: () => {
              if (status == Constant.notYet)
                {showToast("Please complete the certification in order.")}
              else if (status == Constant.wait || status == Constant.refuse)
                {NavigatorUtils.push(context, _routeMap[verifyItem.cCode]!)}
            },
          ),
        );
      },
    );
  }
}
