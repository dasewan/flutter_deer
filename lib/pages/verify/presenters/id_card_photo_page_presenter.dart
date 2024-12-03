import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp9/mvp/base_page_presenter.dart';
import 'package:myapp9/net/net.dart';
import 'package:myapp9/pages/verify/iviews/id_card_photo_i_mvp_view.dart';
import 'package:sp_util/sp_util.dart';

import '../../../config/constant.dart';
import '../../../models/q_a_ocr_entity.dart';
import '../router/verify_router.dart';

class IdCardPhotoPagePresenter extends BasePagePresenter<IdCardPhotoIMvpView> {
  @override
  void initState() {}

  /// 上传图片实现
  Future<String> uploadImg2(XFile? image, XFile? image2) async {
    String imgPath = '';
    try {
      final String path = image!.path;
      final String name = path.substring(path.lastIndexOf('/') + 1);
      final String path2 = image2!.path;
      final String name2 = path.substring(path2.lastIndexOf('/') + 1);
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'x_picture_1': await MultipartFile.fromFile(path, filename: name),
        'y_picture_2': await MultipartFile.fromFile(path2, filename: name2),
      });
      // FormData formData = FormData.fromMap({
      //   "grant_type": "grant_type",
      //   "client_id": "9279c3df-2ef0-4dbc-9a01-3e5373c8839c",
      //   "client_secret": "IP4qpQRfMcejgcuec1vN1U6yx94jx2HoOgbh2YnL",
      //   "scope": "*"
      // });
      await requestNetwork<QAOcrEntity>(Method.post, url: HttpApi.qAOcrStore, params: formData, onSuccess: (data) {
        if (data != null) {
          if (data.data!.ocrResult != null && data.data!.ocrResult!.hIdnumber != null) {
            SpUtil.putString(Constant.ocrIdResult, data.data!.ocrResult!.hIdnumber!);
          }
          if (data.data!.ocrResult != null && data.data!.ocrResult!.lName1 != null) {
            SpUtil.putString(Constant.ocrNameResult, data.data!.ocrResult!.lName1!);
          }
          if (data.data!.next == '') {
            view.onCreateRefuse(data.message!);
            return;
          }
          SpUtil.putString(Constant.idCardOrPhoto, VerifyRouter.idCard);

          view.onUploadSuccess(data.data?.ocrResult?.hIdnumber, data.data?.ocrResult?.lName1);
        }
      });
    } catch (e) {
      view.showToast('图片上传失败2！');
    }
    return imgPath;
  }
}
