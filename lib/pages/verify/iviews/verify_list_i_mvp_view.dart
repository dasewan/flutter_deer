import 'package:myapp9/models/q_verify_item_entity.dart';
import 'package:myapp9/mvp/mvps.dart';
import 'package:myapp9/providers/verify_provider.dart';

abstract class VerifyListIMvpView implements IMvpView {
  VerifyProvider get provider;
  List<QVerifyItemEntity> get qVerifyItmeEntityList;
  setQVerifyItemEntityList(List<QVerifyItemEntity> list);
}
