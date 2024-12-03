import 'package:flutter/material.dart';

import '../../../generated/d_borrow_index_entity.dart';
import '../../../mvp/base_page.dart';
import '../../../widgets/my_app_bar.dart';
import '../iview/order_iview.dart';
import '../presenter/order_presenter.dart';
import '../widgets/order_item.dart';

/// design/8设置/index.html#artboard2
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with BasePageMixin<OrderPage, OrderPagePresenter> implements OrderIMvpView {
  final ScrollController _scrollController = ScrollController();
  late OrderPagePresenter _orderPagePresenter;
  List<DBorrowIndexData> _borrows = [];
  int page = 1;
  bool isLoading = true;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  OrderPagePresenter createPresenter() {
    _orderPagePresenter = OrderPagePresenter();
    return _orderPagePresenter;
  }

  @override
  void goRepay() {
    setState(() {});
    // NavigatorUtils.push(context, VerifyRouter.swipper);
  }

  @override
  void index(List<DBorrowIndexData> data) {
    _borrows.addAll(data);
    setState(() {
      _borrows = _borrows;
      isLoading = false;
      page++;
      if (data.isEmpty) {
        hasMoreData = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: 'My Order',
      ),
      body: Scrollbar(
        // 加个滚动条
        controller: _scrollController,
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!isLoading && (scrollInfo.metrics.maxScrollExtent - scrollInfo.metrics.pixels).round() <= 200) {
                    setState(() {
                      isLoading = true;
                    });
                    _orderPagePresenter.index(false, page);
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: _borrows.length,
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 28.0),
                  itemBuilder: (_, index) => OrderItem(data: _borrows[index]),
                ),
              ),
            ),
            Container(
              height: isLoading ? 40.0 : 0.0,
              child: CircularProgressIndicator(),
            ),
            Container(
              height: !hasMoreData ? 50.0 : 0.0,
              child: Text("You have watched all the posts"),
            ),
          ],
        ),
      ),
    );
  }
}
