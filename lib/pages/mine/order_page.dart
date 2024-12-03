import 'package:flutter/material.dart';
import 'package:myapp9/pages/mine/widgets/goods_sort_menu.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/theme_utils.dart';
import 'package:myapp9/util/toast_utils.dart';
import 'package:myapp9/widgets/load_image.dart';
import 'package:myapp9/widgets/popup_window.dart';
import 'package:provider/provider.dart';

import '../../providers/order_list_page_provider.dart';
import '../../widgets/my_app_bar.dart';
import 'order_list_tab_page.dart';

/// design/4商品/index.html
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<String> _sortList = [
    '全部订单',
    '审核中',
    '已拒绝',
    '待还款',
    '已逾期',
    '已关闭',
    '已结清',
  ];
  final List<int> _sortCountList = [
    10,
    3,
    2,
    1,
    1,
    1,
    1,
  ];
  TabController? _tabController;
  final PageController _pageController = PageController();
  bool _expand = false;
  final GlobalKey _addKey = GlobalKey();
  final GlobalKey _bodyKey = GlobalKey();
  final GlobalKey _buttonKey = GlobalKey();

  OrderListPageProvider provider = OrderListPageProvider();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  /// https://github.com/flutter/flutter/issues/72908
  @override
  // ignore: must_call_super
  void didChangeDependencies() {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Color? iconColor = ThemeUtils.getIconColor(context);
    return ChangeNotifierProvider<OrderListPageProvider>(
      create: (_) => provider,
      child: Scaffold(
        appBar: const MyAppBar(
          centerTitle: 'All Application',
          // isBack: false,
          backgroundColor: Colors.blueAccent,
          titleColor: Colors.white,
          backImgColor: Colors.white,
        ),
        body: Column(
          key: _bodyKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap12,
            GestureDetector(
              key: _buttonKey,

              /// 使用Selector避免同provider数据变化导致此处不必要的刷新
              child: Selector<OrderListPageProvider, int>(
                selector: (_, provider) => provider.sortIndex,

                /// 精准判断刷新条件（provider 4.0新属性）
//                  shouldRebuild: (previous, next) => previous != next,
                builder: (_, sortIndex, __) {
                  // 只会触发sortIndex变化的刷新
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Gaps.hGap16,
                      Text(
                        _sortList[sortIndex],
                        style: TextStyles.textBold24,
                      ),
                      Gaps.hGap8,
                      LoadAssetImage(
                        'expand',
                        width: 16.0,
                        height: 16.0,
                        color: iconColor,
                      )
                    ],
                  );
                },
              ),
              onTap: () => _showSortMenu(),
            ),
            Gaps.vGap24,
/*            Container(
              // 隐藏点击效果
              padding: const EdgeInsets.only(left: 16.0),
              color: context.backgroundColor,
              child: TabBar(
                onTap: (index) {
                  if (!mounted) {
                    return;
                  }
                  _pageController.jumpToPage(index);
                },
                isScrollable: true,
                controller: _tabController,
                labelStyle: TextStyles.textBold18,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: context.isDark ? Colours.text_gray : Colours.text,
                labelColor: Theme.of(context).primaryColor,
                indicatorPadding: const EdgeInsets.only(right: 98.0 - 36.0),
                tabs: const <Widget>[
                  _TabView('在售', 0),
                  _TabView('待售', 1),
                  _TabView('下架', 2),
                ],
              ),
            ),*/
            Gaps.line,
            Expanded(
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  key: const Key('pageView'),
                  itemCount: _sortList.length,
                  onPageChanged: _onPageChange,
                  controller: _pageController,
                  itemBuilder: (_, int index) => OrderListTabPage(index: index)),
            )
          ],
        ),
      ),
    );
  }

  void _onPageChange(int index) {
    _tabController?.animateTo(index);
    provider.setIndex(index);
  }

  /// design/4商品/index.html#artboard3
  void _showSortMenu() {
    // 获取点击控件的坐标
    final RenderBox button = _buttonKey.currentContext!.findRenderObject()! as RenderBox;
    final RenderBox body = _bodyKey.currentContext!.findRenderObject()! as RenderBox;

    showPopupWindow<void>(
      context: context,
      offset: const Offset(0.0, 12.0),
      anchor: button,
      child: GoodsSortMenu(
        data: _sortList,
        height: body.size.height - button.size.height,
        sortIndex: provider.sortIndex,
        onSelected: (index, name) {
          provider.setSortIndex(index);
          _pageController.jumpToPage(index);
          Toast.show('选择分类: $name');
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _TabView extends StatelessWidget {
  const _TabView(this.tabName, this.index);

  final String tabName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SizedBox(
        width: 98.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tabName),
            Consumer<OrderListPageProvider>(
              builder: (_, provider, child) {
                return Visibility(
                  visible: !(provider.goodsCountList[index] == 0 || provider.index != index),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      ' (${provider.goodsCountList[index]}件)',
                      style: const TextStyle(fontSize: Dimens.font_sp12),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
