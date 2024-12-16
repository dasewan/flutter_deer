import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/liveness/router/liveness_router.dart';
import 'package:myapp9/pages/sign/iviews/sign_i_mvp_view.dart';
import 'package:myapp9/pages/sign/presenters/sign_page_presenter.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/pages/sign/widgets/confirm_dialog.dart';
import 'package:myapp9/pages/sign/widgets/product_widget.dart';
import 'package:myapp9/providers/sign_provider.dart';
import 'package:myapp9/res/gaps.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:myapp9/widgets/click_item.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';
import 'package:provider/provider.dart';

import '../../providers/product_new_provider.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key, this.productId}) : super(key: key);
  final String? productId;

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage>
    with BasePageMixin<SignPage, SignPagePresenter>
    implements SignIMvpView {
  late SignPagePresenter _signPagePresenter;
  static const platform = MethodChannel('samples.flutter.io/battery');
  int dataUploadCount = 0;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }

  void updateDataUploadCount() {
    setState(() {
      dataUploadCount = dataUploadCount + 1;
    });
  }

  @override
  SignProvider provider = SignProvider();

  @override
  SignPagePresenter createPresenter() {
    _signPagePresenter = SignPagePresenter(productId: widget.productId);
    return _signPagePresenter;
  }

  @override
  void signSuccess(String tip1, String tip2, String tip3, String tip4) {
    NavigatorUtils.push(context, "${SignRouter.signSuccess}?tip1=$tip1&tip2=$tip2&tip3=$tip3&tip4=$tip4", clearStack: true);
  }

  void dBorrowsStore(int id){
    NavigatorUtils.push(context, '${LivenessRouter.liveness}?productId=$id', replace: true);
    // _signPagePresenter.dBorrowsStore(true, id);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  @override
  Future<bool> requestOpsPermission() async {
    Map<String, dynamic> arguments = <String, dynamic>{
      'type': "sms",
    };
    final bool has3 = await platform.invokeMethod('checkOpsPermission', arguments) as bool;
    if (!has3) {
      showCupertinoDialogSub(title: "短信授权", content: "请到系统设置，授权app短信授权");
    } else {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'Loan Application',
        ),
        body: MyScrollView(
          key: const Key('goods_edit_page'),
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          bottomButton: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Column(
              children: [
                MyButton(
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => ConfirmDialog(onPressed: (id) {
                              dBorrowsStore(id);
                            }));
                  },
                  text: Myapp9Localizations.of(context)!.apply,
                ),
                Gaps.vGap4,
                Row(
                  children: [
                    Expanded(child: Gaps.hGap4),
                    Text(
                      'For any questions, contact via ',
                      style: TextStyle(
                      ),
                    ),
                  //todo 后台分配是个whatsapp账号，根据用户手机号来指定每个用户所属的whatsapp
                  GestureDetector(
                    onTap: () => Utils.launchWhatsAppURL('123123'),
                    child: Text(
                      'WhatsApp',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                    Expanded(child: Gaps.hGap4),
                ],)
              ],
            ),
          ),
          children: <Widget>[
            Consumer<ProductNewProvider>(
              builder: (_, provider, __) {
                return ProductWidget(
                  bProduct: provider.bProductEntity,
                );
              },
            ),
            ChangeNotifierProvider<SignProvider>(
              create: (_) => provider,
              child: Consumer<SignProvider>(builder: (_, provider, __) {
                return Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: provider.dBorrowSignDataPreComputeList != null ? provider.dBorrowSignDataPreComputeList!.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        // return Text("data");
                        return ClickItem(
                          title: provider.dBorrowSignDataPreComputeList![index].text.nullSafe,
                          rightChild: provider.dBorrowSignDataPreComputeList![index].value,
                          tooltip: provider.dBorrowSignDataPreComputeList![index].remark.nullSafe,
                          height: 40,
                          margin: const EdgeInsets.only(left: 5.0),
                          padding: const EdgeInsets.fromLTRB(0, 5.0, 5.0, 5.0),
                        );
                      }),
                );
              }),
            )
          ],
        ));
  }


}
