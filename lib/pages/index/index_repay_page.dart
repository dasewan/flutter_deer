import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/index/presenters/index_repay_page_presenter.dart';
import 'package:myapp9/pages/index/widgets/product_widget.dart';
import 'package:myapp9/pages/index/widgets/text_scroll.dart';
import 'package:myapp9/pages/repay/router/repay_router.dart';
import 'package:myapp9/providers/index_first_provider.dart';
import 'package:myapp9/res/raw/gaps.dart';
import 'package:provider/provider.dart';

import '../../routers/fluro_navigator.dart';
import '../../util/toast_utils.dart';
import '../verify/fitness_app_theme.dart';
import 'iviews/index_repay_i_mvp_view.dart';

class IndexRepayPage extends StatefulWidget {
  const IndexRepayPage({Key? key}) : super(key: key);

  @override
  _IndexRepayPageState createState() => _IndexRepayPageState();
}

class _IndexRepayPageState extends State<IndexRepayPage> with BasePageMixin<IndexRepayPage, IndexRepayPagePresenter> implements IndexRepayIMvpView {
  late IndexRepayPagePresenter _indexRepayPagePresenter;

  int scrollingTextIndex = 0;
  List<String> news = [
    '1. Your repayment date is 2024-01-05, which is already 3 days overdue. Please make repayment. ',
    '2. Please use the app to repay, or choose the repayment page to repay. Please do not transfer money to strangers.',
    '3. Maintaining good repayment behavior can increase your limit and more loanable products.',
    '4. Maintaining good repayment behavior can increase your limit and more loanable products.',
    '5. Maintaining good repayment behavior can increase your limit and more loanable products.',
  ];
  List<IconData> newsIcon = [
    Icons.warning_amber,
    Icons.notifications_on_outlined,
    Icons.notifications_on_outlined,
    Icons.notifications_on_outlined,
    Icons.notifications_on_outlined
  ];
  List<Color> newsColor = [Colors.pink, Colors.amber, Colors.amber, Colors.amber, Colors.amber];
  List<CarouselItem> itemList = [
    CarouselItem(
      image: Image.asset('assets/images/index/banner1.png', fit: BoxFit.fill).image,
      // image:LoadAssetImage('assets/images/index/banner1.png',),

      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {
        Toast.show('image1');
      },
    ),
    CarouselItem(
      image: Image.asset('assets/images/index/banner2.png', fit: BoxFit.fill).image,
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {
        Toast.show('image2');
      },
    ),
    CarouselItem(
      image: Image.asset('assets/images/index/banner3.png', fit: BoxFit.fill).image,
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {
        Toast.show('image3');
      },
    ),
  ];

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexRepayPagePresenter.index(false);
    // });
  }

  @override
  // TODO: implement provider
  // IndexFirstProvider get provider => IndexFirstProvider();
  IndexFirstProvider provider = IndexFirstProvider();

  @override
  IndexRepayPagePresenter createPresenter() {
    _indexRepayPagePresenter = IndexRepayPagePresenter();
    return _indexRepayPagePresenter;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  @override
  void showPopupOverlay(int indexAction) {
/*    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => RepayDialog(indexAction: indexAction, onPressed: (id) => print(id)),
    );*/
  }

  void _next(int productId, int indexAction, int borrowId, int borrowStatus) {
    print('repay');
    NavigatorUtils.push(context, '${RepayRouter.repay}?borrowId=$borrowId');
  }

  List<Widget> _sliverBuilder(BuildContext context, innerBoxIsScrolled) {
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.indigoAccent[700],
          elevation: 0.0,
          centerTitle: true,
          expandedHeight: 180.0,
          // 不随着滑动隐藏标题
          pinned: true,
          forceElevated: true,
          // 固定在顶部
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                // color: Colors.blueAccent,
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF0000FF), Color(0xFFFFFFFF)]),
              ),
              child: CustomCarouselSlider(
                items: itemList,
                height: 160,
                subHeight: 50,
                width: MediaQuery.of(context).size.width,
                autoplay: true,
                showSubBackground: false,
                showText: false,
              ),
            ),
            centerTitle: true,
            titlePadding: const EdgeInsetsDirectional.only(start: 16.0, bottom: 14.0),
            collapseMode: CollapseMode.pin,
            title: const Text("Best Loan"),
          ),
        ),
      ),
      SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: SliverAppBarDelegate(
          DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: FitnessAppTheme.grey.withOpacity(0.4), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                  ],
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: false,
                      viewportFraction: 1.1,
                      autoPlay: true,
                      scrollDirection: Axis.vertical,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration: const Duration(milliseconds: 200)),
                  items: [0, 1, 2, 3, 4].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Row(
                          children: [
                            Gaps.hGap4,
                            Icon(
                              newsIcon[i],
                              color: newsColor[i],
                            ),
                            Gaps.hGap4,
                            // Container(child: Text("123")),
                            Expanded(
                                child: TextScroll2(
                              news[i],
                              velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                              delayBefore: Duration(seconds: 2),
                              numberOfReps: 2,
                              pauseBetween: Duration(seconds: 1),
                              style: TextStyle(color: Colors.indigoAccent),
                              textAlign: TextAlign.right,
                              selectable: true,
                            )),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              )),
          30.0,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IndexFirstProvider>(
      create: (_) => provider,
      child: Scaffold(body: Consumer<IndexFirstProvider>(builder: (_, provider, __) {
        String? userProducts = provider.aUser?.nProducts;
        int yIndexAction = provider.aUser?.iIndexAction ?? 0;
        int creditFraction = provider.aUser?.gCreditFraction ?? 0;
        int overdueTimes = provider.aUser?.aHOverdueTimes ?? 0;
        int repayMaxOverdueDays = provider.aUser?.aIRepayMaxOverdueDays ?? 0;
        return Container(
          color: Colors.grey[200],
          child: Stack(
            children: <Widget>[
              NestedScrollView(
                key: const Key('order_list'),
                physics: const ClampingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) => _sliverBuilder(context, innerBoxIsScrolled),
                body: Builder(builder: (context) {
                  return CustomScrollView(
                    key: const PageStorageKey<String>("hello2"),
                    slivers: <Widget>[
                      SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (content, index) {
                            // return ListTile(title: Text("$index"));
                            BProductEntity bProduct = provider.bProducts![index];
                            bProduct.cAmount = bProduct.cAmount! > 0 ? bProduct.cAmount : provider.aUser!.fCreditAmount!;
                            List<int> onWayProductIdList = provider.aUser!.uOnWayProductId!.split(',').map((stringNumber) => int.parse(stringNumber)).toList();
                            bool lock = !onWayProductIdList.contains(bProduct.id);
                            if (!lock) {
                              int unionIndex = onWayProductIdList.indexOf(bProduct.id!);
                              List<int> onWayBorrowIdList = provider.aUser!.rCurrentBorrowId!.split(',').map((stringNumber) => int.parse(stringNumber)).toList();
                              int borrowId = onWayBorrowIdList.elementAt(unionIndex);
                              List<int> onWayBorrowStatusList =
                                  provider.aUser!.tCurBorrowStatus!.split(',').map((stringNumber) => int.parse(stringNumber)).toList();
                              int borrowStatus = onWayBorrowStatusList.elementAt(unionIndex);
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                                child: ProductWidget(
                                  key: Key(bProduct.id.toString()),
                                  bProduct: bProduct,
                                  lock: lock,
                                  yIndexAction: yIndexAction,
                                  onPressed: (id, indexAction) {
                                    _next(id, indexAction, borrowId, borrowStatus);
                                  },
                                  actionRoute: provider.actionRoute,
                                  borrowId: borrowId,
                                  borrowStatus: borrowStatus,
                                ),
                              );
                            }
                            return ProductWidget(
                                key: Key(bProduct.id.toString()),
                                bProduct: bProduct,
                                lock: lock,
                                yIndexAction: yIndexAction,
                                onPressed: (id, indexAction) {},
                                actionRoute: provider.actionRoute);
                          },
                          childCount: provider.bProducts?.length ?? 0,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        );
      })),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this.widget, this.height);

  final Widget widget;
  final double height;

  // minHeight 和 maxHeight 的值设置为相同时，header就不会收缩了
  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

/*  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }*/
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
  }
}

class PromoDialog extends StatefulWidget {
  @override
  _PromoDialogState createState() => _PromoDialogState();
}

class _PromoDialogState extends State<PromoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('推广弹窗'),
      content: Text('这里是推广内容'),
      actions: [
        TextButton(
          child: Text('关闭'),
          onPressed: () {
            Navigator.of(context).pop(); // 关闭弹窗
          },
        ),
      ],
    );
  }
}
