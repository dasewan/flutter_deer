import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/index/index_first_page.dart';

class SliverDemoPage extends StatelessWidget {
  SliverDemoPage({
    Key? key,
    required this.child,
    required this.appbar,
    required this.title,
  }) : super(key: key);
  Widget child;
  Widget appbar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: const Key('order_list'),
      physics: const ClampingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) => _sliverBuilder(context),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: child,
      ),
    );
  }

  List<Widget> _sliverBuilder(BuildContext context) {
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          title: Text(title),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.indigoAccent[700],
          elevation: 0.0,
          centerTitle: true,
          expandedHeight: 10.0,
          // 不随着滑动隐藏标题
          pinned: false,
          // 固定在顶部
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.indigoAccent[700],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: appbar,
            ),
          ),
          80.0,
        ),
      ),
    ];
  }
}
