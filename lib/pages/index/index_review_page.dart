import 'package:flutter/material.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/index/iviews/index_review_i_mvp_view.dart';
import 'package:myapp9/pages/index/presenters/index_review_page_presenter.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:myapp9/widgets/click_item.dart';
import 'package:myapp9/widgets/load_image.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_scroll_view.dart';
import 'package:provider/provider.dart';

import '../../providers/index_review_provider.dart';
import '../../res/raw/gaps.dart';
import '../../res/raw/styles.dart';

class IndexReviewPage extends StatefulWidget {
  const IndexReviewPage({Key? key}) : super(key: key);

  @override
  _IndexReviewPageState createState() => _IndexReviewPageState();
}

class _IndexReviewPageState extends State<IndexReviewPage> with BasePageMixin<IndexReviewPage, IndexReviewPagePresenter> implements IndexReviewIMvpView {
  late IndexReviewPagePresenter _indexReviewPagePresenter;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }

  @override
  IndexReviewProvider provider = IndexReviewProvider();

  @override
  IndexReviewPagePresenter createPresenter() {
    _indexReviewPagePresenter = IndexReviewPagePresenter();
    return _indexReviewPagePresenter;
  }

  @override
  void signSuccess() {
    NavigatorUtils.push(context, SignRouter.signSuccess, clearStack: true);
  }

  void dBorrowsStore(int id) {
    // _indexReviewPagePresenter.dBorrowsStore(true, id);
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
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: '1',
        ),
        body: MyScrollView(
          key: const Key('goods_edit_page'),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Gaps.vGap50,
                  const LoadAssetImage(
                    'icon_success',
                    width: 80.0,
                    height: 80.0,
                  ),
                  Gaps.vGap12,
                  const Text(
                    '您的资料正在审核中',
                    style: TextStyles.textSize16,
                  ),
                  Gaps.vGap8,
                  Text(
                    '2021-02-21 15:20:10',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Gaps.vGap8,
                  Text(
                    '预计审核完成时间：02月28日',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            ChangeNotifierProvider<IndexReviewProvider>(
              create: (_) => provider,
              child: Consumer<IndexReviewProvider>(builder: (_, provider, __) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: provider.dBorrowSignDataPreComputeList != null ? provider.dBorrowSignDataPreComputeList!.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        // return Text("data");
                        return ClickItem(
                          title: provider.dBorrowSignDataPreComputeList![index].text.nullSafe,
                          rightChild: provider.dBorrowSignDataPreComputeList![index].value,
                        );
                      }),
                );
              }),
            )
          ],
        ));
  }
}
