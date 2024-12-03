import 'package:flutter/material.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/index/index_first_page.dart';
import 'package:myapp9/pages/index/index_new_page.dart';
import 'package:myapp9/pages/index/index_repay_page.dart';
import 'package:myapp9/pages/index/index_review_page.dart';
import 'package:myapp9/providers/index_no_provider.dart';
import 'package:myapp9/res/raw/gaps.dart';
import 'package:provider/provider.dart';

import 'iviews/index_i_mvp_view.dart';
import 'presenters/index_page_presenter.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with BasePageMixin<IndexPage, IndexPagePresenter> implements IndexIMvpView {
  late IndexPagePresenter _indexPagePresenter;
  @override
  void initState() {
    super.initState();
  }

  @override
  IndexPagePresenter createPresenter() {
    _indexPagePresenter = IndexPagePresenter();
    return _indexPagePresenter;
  }

  @override
  // TODO: 改成userprovider
  IndexNoProvider provider = IndexNoProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IndexNoProvider>(
      create: (_) => provider,
      child: Scaffold(
        body: Consumer<IndexNoProvider>(builder: (_, provider, __) {
          return const IndexNewPage();
          if (provider.indexNo == 1) {
            return const IndexFirstPage();
          } else if (provider.indexNo == 2) {
            return const IndexReviewPage();
          } else if (provider.indexNo == 4) {
            return const IndexRepayPage();
          } else {
            return Gaps.empty;
          }
        }),
      ),
    );
  }
}
