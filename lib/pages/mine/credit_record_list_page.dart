import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp9/models/credit_history_entity.dart';
import 'package:myapp9/pages/mine/presenters/credit_record_list_page_presenter.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_card.dart';

import '../../mvp/base_page.dart';
import 'iviews/credit_record_list_i_mvp_view.dart';
import '../../../util/other_utils.dart';

/// design/8设置/index.html#artboard2
class CreditRecordListPage extends StatefulWidget {
  const CreditRecordListPage({super.key});

  @override
  _CreditRecordListPageState createState() => _CreditRecordListPageState();
}

class _CreditRecordListPageState extends State<CreditRecordListPage>
    with AutomaticKeepAliveClientMixin<CreditRecordListPage>, SingleTickerProviderStateMixin, BasePageMixin<CreditRecordListPage, CreditRecordListPagePresenter>
    implements CreditRecordListIMvpView{
  final ScrollController _scrollController = ScrollController();
  late CreditRecordListPagePresenter _creditRecordListPagePresenter;
  // 模拟真实数据
  List<CreditHistoryData> _transactions = [];
  int _total = -1;
  @override
  CreditRecordListPagePresenter createPresenter() {
    _creditRecordListPagePresenter = CreditRecordListPagePresenter();
    return _creditRecordListPagePresenter;
  }

  @override
  void setStateData(List<CreditHistoryData> data) {
    setState(() {
      _transactions = data;
      _total = data.length;
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: 'Credit History',
        onPressed: () {},
      ),
      body: Scrollbar(
        // 加个滚动条
        controller: _scrollController,
        child: ListView.builder(
          itemCount: _transactions.length,
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 28.0),
          itemBuilder: (_, index) => _MessageItem(credit: _transactions[index],),
        ),
      ),
    );
  }


}

class _MessageItem extends StatefulWidget {
  const _MessageItem({
    super.key,
    required this.credit,
  });

  final CreditHistoryData? credit;

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<_MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Gaps.vGap15,


        MyCard(
            shadowColor: widget.credit!.dAmount! > 0 || widget.credit!.jCreditScore! > 0 ? Colors.green[100] : Colors.red[100],
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(child:
                    _buildText(widget.credit!)),
                    Container(
                      margin: const EdgeInsets.only(right: 4.0),
                      child: widget.credit!.dAmount! > 0 || widget.credit!.jCreditScore! > 0 ? Icon(Icons.arrow_upward, color: Colors.green,size: 24) : Icon(Icons.arrow_downward, color: Colors.red,size: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget _buildText(CreditHistoryData item) {
    String text = '';
    if (item.dAmount! > 0 || item.jCreditScore! > 0) {
        if(item.kOverdueDays! > 0){
          text = ', you were ${item.kOverdueDays!} day late on a payment.';
        }else{
          text = ', you made an on-time payment.';
        }
    }else if(item.kOverdueDays! > 0){
      text = ', you are ${item.kOverdueDays!} days overdue**..';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("On ", style: Theme.of(context).textTheme.titleSmall),
            Text(DateFormat('MMM d, yyyy HH:mm').format(DateTime.parse(widget.credit!.createdAt!)), style: Theme.of(context).textTheme.titleSmall),
            Text(text, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        Gaps.vGap4,
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 12.0),
            children: <TextSpan>[
              const TextSpan(
                text: 'Credit score ',
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              TextSpan(
                text: item.jCreditScore! > 0 ? '+${item.jCreditScore}' : '${item.jCreditScore}',
                style: TextStyle(color: item.jCreditScore! > 0 ? Colors.green : Colors.red,fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
              const TextSpan(
                text: ', credit limit ',
              ),
              TextSpan(
                text: item.dAmount! > 0? '+ ${Utils.formatPrice2(item.dAmount!)}' : '- ${Utils.formatPrice2(item.dAmount!*-1)}',
                style: TextStyle(color: item.dAmount! > 0 ? Colors.green : Colors.red,fontWeight: FontWeight.w600, fontSize: 14.0),
              ),
              TextSpan(
                text: ', now  ${Utils.formatPrice2(item.lAfterCreditAmount!)}',
              ),
            ],
          ),
        ),
      ],
    );


  }
}
