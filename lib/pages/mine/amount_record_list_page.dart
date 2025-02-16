import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp9/pages/mine/presenters/amount_record_list_page_presenter.dart';
import 'package:myapp9/pages/mine/presenters/order_list_tab_page_presenter.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/theme_utils.dart';
import 'package:myapp9/widgets/my_app_bar.dart';

import '../../models/repay_log_entity.dart';
import '../../mvp/base_page.dart';
import '../../util/other_utils.dart';
import '../../widgets/state_layout.dart';
import '../index/index_repay_page.dart';
import 'iviews/amount_record_list_i_mvp_view.dart';

/// design/6店铺-账户/index.html#artboard1
class AccountRecordListPage extends StatefulWidget {
  const AccountRecordListPage({super.key});

  @override
  _AccountRecordListPageState createState() => _AccountRecordListPageState();
}

class _AccountRecordListPageState extends State<AccountRecordListPage>
    with AutomaticKeepAliveClientMixin<AccountRecordListPage>, SingleTickerProviderStateMixin, BasePageMixin<AccountRecordListPage, AmountRecordListPagePresenter>
    implements AmountRecordListIMvpView{
  late AmountRecordListPagePresenter _amountRecordListPagePresenter;
  // 模拟真实数据
  List<RepayLogData> _transactions = [];
  int _total = -1;
  @override
  AmountRecordListPagePresenter createPresenter() {
    _amountRecordListPagePresenter = AmountRecordListPagePresenter();
    return _amountRecordListPagePresenter;
  }

  @override
  void setStateData(List<RepayLogData> data) {
    setState(() {
      _transactions = data;
      _total = data.length;
    });

  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: 'Repay Log',
      ),
      body: _total == 0 ? const StateLayout(type: StateType.empty) : CustomScrollView(
        slivers: _buildGroups(),
      ),
    );
  }

  List<Widget> _buildGroups() {
    // 按日期分组
    final Map<String, List<RepayLogData>> groupedTransactions = {};
    for (final RepayLogData transaction in _transactions) {
      final DateTime createdAt = DateTime.parse(transaction.createdAt!);

      // 将日期格式化为年月日字符串
      String date = DateFormat('yyyy-MM-dd').format(createdAt);
      if (!groupedTransactions.containsKey(date)) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(transaction);
    }

    // 生成Sliver列表
    return groupedTransactions.entries.map((entry) {
      String date = entry.key;
      List<RepayLogData> transactions = entry.value;
      return SliverMainAxisGroup(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                color: ThemeUtils.getStickyHeaderColor(context),
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(date),
              ),
              34.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, index) {
                return _buildItem(transactions[index]);
              },
              childCount: transactions.length,
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildItem(RepayLogData transaction) {
    return Container(
      height: 72.0,
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.8),
        ),
      ),
      child: IndexedSemantics(
        index: _transactions.indexOf(transaction),
        child: Stack(
          children: <Widget>[
            Text(transaction.sReference!),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Text(
                transaction.jStatus == 50 ? 'Paid success' : 'Paid failed',
                style: transaction.jStatus == 50
                    ? TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                )
                    : TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(transaction.createdAt!)), style: Theme.of(context).textTheme.titleSmall),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Text(Utils.formatPrice2(transaction.uAmount!), style: Theme.of(context).textTheme.titleSmall),
            ),
          ],
        ),
      ),
    );
  }


}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  SliverAppBarDelegate(this.child, this.height);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}