import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp9/generated/d_borrow_index_entity.dart';

import '../../../mvp/base_page.dart';
import '../../../widgets/my_app_bar.dart';
import '../../shop/iview/order_iview.dart';
import '../../shop/presenter/order_presenter.dart';
import '../presenter/html_page_presenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '提高信用分',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreditScorePage(),
    );
  }
}

class CreditScorePage extends StatefulWidget {
  @override
  State<CreditScorePage> createState() => _CreditScorePageState();
}

class _CreditScorePageState extends State<CreditScorePage> with BasePageMixin<CreditScorePage, HtmlPagePresenter>, AutomaticKeepAliveClientMixin<CreditScorePage> implements OrderIMvpView {
  late HtmlPagePresenter _htmlPagePresenter;
  List<String> _list = [];
  List<String> _title = [];

  @override
  HtmlPagePresenter createPresenter() {
    _htmlPagePresenter = HtmlPagePresenter();
    return _htmlPagePresenter;
  }
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: 'Improve Your Credit Score',
        // isBack: false,
        backgroundColor: Colors.blueAccent,
        titleColor: Colors.white,
        backImgColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: SvgPicture.asset(
                'assets/images/html/increase.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your credit score is directly linked to your loan amount limit. Here are 4 tips to boost your credit score:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildTip('Make sure the information you provide is accurate. If the system detects any false information, it may lower your credit score.'),
                  _buildTip('Pay your bills on time to maintain a good credit history. Each on-time payment will positively impact your credit score.'),
                  _buildTip('Too many late payments can lower your credit score and make it difficult for you to borrow again.'),
                  _buildTip('Opening the app daily can help increase your credit score.'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[200],
        child: Text(
          '© Copyright © 2010-2025 ParaCash All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }

  Widget _buildTip(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(left: BorderSide(color: Colors.blueAccent.shade200, width: 5)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }


}