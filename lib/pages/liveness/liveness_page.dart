import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/liveness/iviews/liveness_i_mvp_view.dart';
import 'package:myapp9/pages/liveness/presenters/liveness_page_presenter.dart';
import 'package:myapp9/pages/liveness/widgets/confirm_dialog.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/res/raw/gaps.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';

import '../../providers/liveness_provider.dart';



class LivenessPage extends StatefulWidget {
  const LivenessPage({Key? key, this.productId}) : super(key: key);
  final String? productId;

  @override
  _LivenessPageState createState() => _LivenessPageState();
}

class _LivenessPageState extends State<LivenessPage> with BasePageMixin<LivenessPage, LivenessPagePresenter> implements LivenessIMvpView {
  late LivenessPagePresenter _livenessPagePresenter;
  static const platform = MethodChannel('samples.flutter.io/battery');

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }

  @override
  LivenessProvider provider = LivenessProvider();

  @override
  LivenessPagePresenter createPresenter() {
    _livenessPagePresenter = LivenessPagePresenter(productId: widget.productId);
    return _livenessPagePresenter;
  }

  @override
  void signSuccess(String tip1, String tip2, String tip3, String tip4) {
    NavigatorUtils.push(context, "${SignRouter.signSuccess}?tip1=$tip1&tip2=$tip2&tip3=$tip3&tip4=$tip4", clearStack: true);
  }

  void dBorrowsStore(List<String?> listFace) {
    _livenessPagePresenter.dBorrowsStore(true, int.parse(widget.productId!), listFace);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }



  @override
  Widget build(BuildContext context) {
    return Text("123");
  }

  @override
  Future<bool> requestOpsPermission() {
    // TODO: implement requestOpsPermission
    throw UnimplementedError();
  }
}
