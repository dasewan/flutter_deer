import 'package:flutter/material.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_card.dart';

/// design/8设置/index.html#artboard2
class CreditRecordListPage extends StatefulWidget {
  const CreditRecordListPage({super.key});

  @override
  _CreditRecordListPageState createState() => _CreditRecordListPageState();
}

class _CreditRecordListPageState extends State<CreditRecordListPage> {
  final ScrollController _scrollController = ScrollController();

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
          itemCount: 20,
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 28.0),
          itemBuilder: (_, __) => _MessageItem(),
        ),
      ),
    );
  }
}

class _MessageItem extends StatefulWidget {
  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<_MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Gaps.vGap15,
        Text('2021-5-31 17:19:36', style: Theme.of(context).textTheme.titleSmall),
        Gaps.vGap8,
        MyCard(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Expanded(child: Text('准时还款，信用分+1000')),
                    Container(
                      margin: const EdgeInsets.only(right: 4.0),
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ],
                ),
                Gaps.vGap8,
              ],
            ),
          ),
        )
      ],
    );
  }
}
