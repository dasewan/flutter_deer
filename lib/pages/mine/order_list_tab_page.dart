import 'package:flutter/material.dart';
import 'package:myapp9/pages/mine/presenters/order_list_tab_page_presenter.dart';
import 'package:provider/provider.dart';

import '../../models/borrow_list_entity.dart';
import '../../mvp/base_page.dart';
import '../../providers/order_list_page_provider.dart';
import '../../util/toast_utils.dart';
import '../../widgets/my_refresh_list.dart';
import '../../widgets/state_layout.dart';
import 'iviews/order_list_i_mvp_view.dart';
import 'widgets/order_item.dart';

class OrderListTabPage extends StatefulWidget {
  const OrderListTabPage({super.key, required this.index});

  final int index;

  @override
  _OrderListTabPageState createState() => _OrderListTabPageState();
}

class _OrderListTabPageState extends State<OrderListTabPage>
    with AutomaticKeepAliveClientMixin<OrderListTabPage>, SingleTickerProviderStateMixin, BasePageMixin<OrderListTabPage, OrderListTabPagePresenter>
    implements OrderListIMvpView {
  late OrderListTabPagePresenter _orderListTabPagePresenter;
  int _selectIndex = -1;
  late Animation<double> _animation;
  late AnimationController _controller;
  List<BorrowListData> _list = [];
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    // 初始化动画控制
    _controller = AnimationController(duration: const Duration(milliseconds: 450), vsync: this);
    // 动画曲线
    final curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    _animation = Tween(begin: 0.0, end: 1.1).animate(curvedAnimation)
      ..addStatusListener((status) {
        _animationStatus = status;
      });

    //Item数量
    _maxPage = widget.index == 0 ? 1 : (widget.index == 1 ? 2 : 3);
  }

  @override
  OrderListPageProvider provider = OrderListPageProvider();

  @override
  OrderListTabPagePresenter createPresenter() {
    _orderListTabPagePresenter = OrderListTabPagePresenter(widget.index);
    return _orderListTabPagePresenter;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<String> _imgList = [
    'https://hbimg.b0.upaiyun.com/29cdf569b916ec8b952804a93b0a77e8c9baf61a58e0b-A0orbz_fw658',
    'https://hbimg.huabanimg.com/528c11bba65e2b8c0b6ae56f05e66b68f78f545f4ff26-tkM2Lx_fw658',
    'https://img2.baidu.com/it/u=272387872,295674292&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
    'https://img0.baidu.com/it/u=2202484983,917817934&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
    'https://img0.baidu.com/it/u=2329453320,961102964&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500'
  ];

  Future<dynamic> _onRefresh() async {
    await _orderListTabPagePresenter.index(false, widget.index, true);
  }

  Future<dynamic> _loadMore() async {
    await _orderListTabPagePresenter.index(false, widget.index, false);
  }

  void _setGoodsCount(int count) {
//    Provider.of<GoodsPageProvider>(context, listen: false).setGoodsCount(count);
    /// 与上方等价，provider 4.1.0添加的拓展方法
    // context.read<OrderListPageProvider>().setGoodsCount(count);
  }

  int _page = 1;
  late int _maxPage;
  StateType _stateType = StateType.empty;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<OrderListPageProvider>(
        create: (_) => provider,
        child: Consumer<OrderListPageProvider>(builder: (_, provider, __) {
          return MyListView(
              itemCount: provider.tabPageData[widget.index].length,
              stateType: provider.tabPageCurrentTotal[widget.index] == 0 ? StateType.empty : StateType.loading,
              onRefresh: _onRefresh,
              loadMore: _loadMore,
              hasMore: provider.hasMorePagesList[widget.index],
              itemBuilder: (_, index) {
                return OrderItem(
                  index: index,
                  // heroTag: heroTag,
                  selectIndex: _selectIndex,
                  item: provider.tabPageData[widget.index][index],
                  animation: _animation,
                  onTapMenu: () {
                    /// 点击其他item时，重置状态
                    if (_selectIndex != index) {
                      _animationStatus = AnimationStatus.dismissed;
                    }

                    /// 避免动画中重复执行
                    if (_animationStatus == AnimationStatus.dismissed) {
                      // 开始执行动画
                      _controller.forward(from: 0.0);
                    }
                    setState(() {
                      _selectIndex = index;
                    });
                  },
                  onTapMenuClose: () {
                    if (_animationStatus == AnimationStatus.completed) {
                      _controller.reverse(from: 1.1);
                    }
                    _selectIndex = -1;
                  },
                  onTapEdit: () {
                    setState(() {
                      _selectIndex = -1;
                    });
                  },
                  onTapOperation: () {
                    Toast.show('');
                  },
                );
              });
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
