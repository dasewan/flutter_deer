import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/myapp9_localizations.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/verify/iviews/id_card_photo_i_mvp_view.dart';
import 'package:myapp9/pages/verify/presenters/id_card_photo_page_presenter.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/device_utils.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';
import 'package:myapp9/widgets/selected_image.dart';
import 'package:sp_util/sp_util.dart';

import '../../config/constant.dart';

/// design/6/index.html#artboard2
class IdCardPhoto3Page extends StatefulWidget {
  const IdCardPhoto3Page({Key? key}) : super(key: key);

  @override
  _IdCardPhotoPageState createState() => _IdCardPhotoPageState();
}

class _IdCardPhotoPageState extends State<IdCardPhoto3Page>
    with
        BasePageMixin<IdCardPhoto3Page, IdCardPhotoPagePresenter>,
        SingleTickerProviderStateMixin
    implements IdCardPhotoIMvpView {
  late IdCardPhotoPagePresenter _idCardPhotoPagePresenter;

  final GlobalKey<SelectedImageState> _imageGlobalKey =
  GlobalKey<SelectedImageState>();
  final GlobalKey<SelectedImageState> _imageGlobalKey2 =
  GlobalKey<SelectedImageState>();



  @override
  void initState() {
    super.initState();
  }


  // 初始化摄像头


  @override
  void dispose() {
    super.dispose();
  }

  @override
  IdCardPhotoPagePresenter createPresenter() {
    _idCardPhotoPagePresenter = IdCardPhotoPagePresenter();
    return _idCardPhotoPagePresenter;
  }

  @override
  void onUploadSuccess(String? id, String? name) {
    NavigatorUtils.push(context, '${VerifyRouter.idCard}?id=$id&name=$name',
        replace: true);
  }

  @override
  void onCreateRefuse(String message) {
    // NavigatorUtils.goBack(context);
    // NavigatorUtils.goBack(context);
    showToast(message);
  }
  void _next(String path) {
    SpUtil.putString(Constant.idCardPhotoPath, path);
    SpUtil.putString(Constant.idCardOrPhoto, VerifyRouter.handIdCardPhoto);
    NavigatorUtils.push(context, '${VerifyRouter.idCard}', replace: true);
  }


  @override
  Widget build(BuildContext context) {
    return Text("123")
    ;
  }

}
