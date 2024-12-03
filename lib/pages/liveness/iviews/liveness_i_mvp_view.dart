import 'package:myapp9/mvp/mvps.dart';

import '../../../providers/liveness_provider.dart';

abstract class LivenessIMvpView implements IMvpView {
  LivenessProvider get provider;

  void signSuccess(String tip1, String tip2, String tip3, String tip4);

  Future<bool> requestOpsPermission();
}
