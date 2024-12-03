import 'package:myapp9/mvp/mvps.dart';

import '../../../providers/index_review_provider.dart';

abstract class IndexReviewIMvpView implements IMvpView {
  IndexReviewProvider get provider;

  void signSuccess();
}
