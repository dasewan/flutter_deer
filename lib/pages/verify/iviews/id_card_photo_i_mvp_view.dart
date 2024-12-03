import 'package:myapp9/mvp/mvps.dart';

abstract class IdCardPhotoIMvpView implements IMvpView {
  void onUploadSuccess(String? id, String? name);

  void onCreateRefuse(String message);
}
