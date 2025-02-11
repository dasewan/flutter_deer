import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp9/generated/d_borrow_index_entity.dart';
import 'package:myapp9/res/gaps.dart';

import '../../../models/html_entity.dart';
import '../../../mvp/base_page.dart';
import '../../../widgets/my_app_bar.dart';
import '../../shop/iview/order_iview.dart';
import '../../shop/presenter/order_presenter.dart';
import '../iview/html_iview.dart';
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
      home: HelpPage(),
    );
  }
}

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> with BasePageMixin<HelpPage, HtmlPagePresenter>, AutomaticKeepAliveClientMixin<HelpPage> implements HtmlIMvpView {
  late HtmlPagePresenter _htmlPagePresenter;
  List<HtmlDataHelpList> _list = [];
  String _title = '';
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _htmlPagePresenter.index(1, true);
    });
  }
  @override
  void setData(HtmlData data) {
    setState(() {
      _list = data.help!.list!;
      _title = data.help!.title!;
    });

  }
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
        centerTitle: 'Help Center',
        // isBack: false,
        backgroundColor: Colors.blueAccent,
        titleColor: Colors.white,
        backImgColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: SvgPicture.asset(
                'assets/images/html/question.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    child: ExpansionTile(
                      leading: Icon(Icons.question_answer, color: Colors.blue), // 添加图标
                      title: Text(
                        _list[index].q!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      children: <Widget>[
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300), // 添加动画效果
                          padding: EdgeInsets.all(16),
                          child: Text(
                            _list[index].a!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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

}