import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/html_entity.dart';
import '../../../mvp/base_page.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/my_app_bar.dart';
import '../iview/html_iview.dart';
import '../presenter/html_page_presenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Us',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatefulWidget {
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> with BasePageMixin<AboutUsPage, HtmlPagePresenter>, AutomaticKeepAliveClientMixin<AboutUsPage> implements HtmlIMvpView {
  late HtmlPagePresenter _htmlPagePresenter;
  List<HtmlDataAboutList> _list = [];
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
      _list = data.about!.list!;
      _title = data.about!.title!;
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
      appBar: MyAppBar(
        centerTitle: 'About Us',
        // isBack: false,
        backgroundColor: Colors.blueAccent,
        titleColor: Colors.white,
        backImgColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              alignment: Alignment.center,
              child: LoadAssetImage('html/about2'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        _list[index].title!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(_list[index].content!,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),



          ],
        ),
      ),
    );
  }
}