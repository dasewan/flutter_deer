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

/// design/6/index.html#artboard2
class IdCardPhotoPage extends StatefulWidget {
  const IdCardPhotoPage({Key? key}) : super(key: key);

  @override
  _IdCardPhotoPageState createState() => _IdCardPhotoPageState();
}

class _IdCardPhotoPageState extends State<IdCardPhotoPage>
    with BasePageMixin<IdCardPhotoPage, IdCardPhotoPagePresenter>, SingleTickerProviderStateMixin
    implements IdCardPhotoIMvpView {
  late IdCardPhotoPagePresenter _idCardPhotoPagePresenter;

  final GlobalKey<SelectedImageState> _imageGlobalKey = GlobalKey<SelectedImageState>();
  final GlobalKey<SelectedImageState> _imageGlobalKey2 = GlobalKey<SelectedImageState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  IdCardPhotoPagePresenter createPresenter() {
    _idCardPhotoPagePresenter = IdCardPhotoPagePresenter();
    return _idCardPhotoPagePresenter;
  }

  @override
  void onUploadSuccess(String? id, String? name) {
    NavigatorUtils.push(context, '${VerifyRouter.idCard}?id=$id&name=$name', replace: true);
  }

  @override
  void onCreateRefuse(String message) {
    // NavigatorUtils.goBack(context);
    // NavigatorUtils.goBack(context);
    showToast(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'Identity Information',
        ),
        body: MyScrollView(
          key: const Key('id_card_photo_page'),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          crossAxisAlignment: CrossAxisAlignment.center,
          bottomButton: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0),
            child: Column(
              children: [
                MyButton(
                  onPressed: () => {_idCardPhotoPagePresenter.uploadImg2(_imageGlobalKey.currentState?.pickedFile, _imageGlobalKey2.currentState?.pickedFile)},
                  text: Myapp9Localizations.of(context)!.next,
                ),
                Gaps.vGap5,
                Text(Myapp9Localizations.of(context)!.verifyBtnTip, style: const TextStyle(color: Colors.brown, fontSize: 9.0)),
              ],
            ),
          ),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              margin: const EdgeInsets.only(right: 4.0),
              decoration: BoxDecoration(
                color: Color(0xFFFF4759),
                borderRadius: BorderRadius.circular(2.0),
              ),
              // height: 16.0,
              alignment: Alignment.center,
              child: Text(
                'Please upload the image according to the example. Ensure all four corners are aligned and the image is clear',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimens.font_sp15,
                  height: Device.isAndroid ? 1.1 : null,
                ),
              ),
            ),
            SelectedImage(
              key: _imageGlobalKey,
              holderImg: 'verify/id_card_sample',
              size: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('ID photo', style: TextStyles.textBold18),
            ),
            SelectedImage(
              key: _imageGlobalKey2,
              holderImg: 'verify/handle_id_card_sample',
              size: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('photo holding ID', style: TextStyles.textBold18),
            ),
          ],
        ));
  }
}
