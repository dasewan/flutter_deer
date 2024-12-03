import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp9/config/constant.dart';
import 'package:myapp9/config/index_action_constant.dart';
import 'package:myapp9/models/b_product_entity.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/index/presenters/index_first_page_presenter.dart';
import 'package:myapp9/pages/index/widgets/product_widget.dart';
import 'package:myapp9/pages/sign/router/sign_router.dart';
import 'package:myapp9/pages/verify/router/verify_router.dart';
import 'package:myapp9/providers/index_first_provider.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../util/image_utils.dart';
import 'iviews/index_first_i_mvp_view.dart';

class IndexFirstPage extends StatefulWidget {
  const IndexFirstPage({Key? key}) : super(key: key);

  @override
  _IndexFirstPageState createState() => _IndexFirstPageState();
}

class _IndexFirstPageState extends State<IndexFirstPage> with BasePageMixin<IndexFirstPage, IndexFirstPagePresenter> implements IndexFirstIMvpView {
  late IndexFirstPagePresenter _indexFirstPagePresenter;
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }

  @override
  // TODO: implement provider
  // IndexFirstProvider get provider => IndexFirstProvider();
  IndexFirstProvider provider = IndexFirstProvider();

  @override
  IndexFirstPagePresenter createPresenter() {
    _indexFirstPagePresenter = IndexFirstPagePresenter();
    return _indexFirstPagePresenter;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  @override
  void createBorrowSuccess() {
    NavigatorUtils.push(context, VerifyRouter.swipper);
  }

  @override
  void goSwipper() {
    NavigatorUtils.push(context, VerifyRouter.swipper);
  }

  @override
  void goVerifyList() {
    showToast("goverifyList");
    // NavigatorUtils.push(context, VerifyRouter.swipper);
  }

  @override
  void goSign() {
    showToast("goSign");
    NavigatorUtils.push(context, SignRouter.sign);
  }

  @override
  void goLiveness() {
    NavigatorUtils.push(context, VerifyRouter.swipper);
  }

  void _next(int productId, int indexAction) {
    switch (IndexActionConst.named(indexAction)) {
      case IndexActionConst.createVerify:
      case IndexActionConst.reCreateBorrow:
        _indexFirstPagePresenter.gVerifiesStore(productId);
        break;
      case IndexActionConst.verifyList:
        if (SpUtil.getBool(Constant.keySwipper, defValue: false)!) {
          goSwipper();
        } else {
          NavigatorUtils.push(context, VerifyRouter.verifyList);
        }
        break;
      case IndexActionConst.reVerifyList:
        goSwipper();
        break;
      case IndexActionConst.sign:
        goSign();
        break;
      case IndexActionConst.liveness:
        goLiveness();
        break;
      default:
        print(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IndexFirstProvider>(
      create: (_) => provider,
      child: Scaffold(
        body: Consumer<IndexFirstProvider>(builder: (_, provider, __) {
          String? userProducts = provider.aUser?.nProducts;
          int yIndexAction = provider.aUser?.iIndexAction ?? 0;
          int creditFraction = provider.aUser?.gCreditFraction ?? 0;
          int overdueTimes = provider.aUser?.aHOverdueTimes ?? 0;
          int repayMaxOverdueDays = provider.aUser?.aIRepayMaxOverdueDays ?? 0;
          return CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              title: const Text('this is .'),
              centerTitle: true,
              // 展开的高度
              expandedHeight: 208.0,
              // 强制显示阴影
              forceElevated: false,
              // 设置该属性，当有下滑手势的时候，就会显示 AppBar
//        floating: true,
              // 该属性只有在 floating 为 true 的情况下使用，不然会报错
              // 当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
              // 当下滑到一定比例，会自动把 AppBar 展开
//        snap: true,
              // 设置该属性使 Appbar 折叠后不消失
//        pinned: true,
              // 通过这个属性设置 AppBar 的背景
              flexibleSpace: FlexibleSpaceBar(
//          title: Text('Expanded Title'),
                // 背景折叠动画
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF5793FA), Color(0xFF4647FA)]),
                  ),
                  // color: Colors.blue[100],
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 240.0,
                      aspectRatio: 18 / 9,
                      enlargeCenterPage: false,
                      viewportFraction: 1.1,
                      autoPlay: true,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                        child: Center(child: Image.network(images[index], fit: BoxFit.cover, width: 1000)),
                      );
                    },
                  ),
                ),
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ImageUtils.getAssetImage('order/bg1'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: 40.0,
                            enlargeCenterPage: false,
                            viewportFraction: 1.1,
                            autoPlay: true,
                            scrollDirection: Axis.vertical,
                            autoPlayInterval: const Duration(seconds: 4),
                            autoPlayAnimationDuration: const Duration(milliseconds: 100)),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                                // margin: const EdgeInsets.only(left: 10),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.announcement,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 16),
                                    // Container(child: Text("123")),
                                    Expanded(
                                        child: TextScroll(
                                      'This is the sample text for Flutter TextScroll widget widget widget widget widget widget .',
                                      mode: TextScrollMode.endless,
                                      velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                                      delayBefore: Duration(milliseconds: 40),
                                      numberOfReps: 5,
                                      pauseBetween: Duration(milliseconds: 1),
                                      style: TextStyle(color: Colors.green),
                                      textAlign: TextAlign.right,
                                      selectable: true,
                                    )),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      )),
                ),
                80.0,
              ),
            ),

            /*SliverToBoxAdapter(
                      child: CarouselSlider(
                        options: CarouselOptions(height: 40.0, enlargeCenterPage: false,viewportFraction: 1.1,autoPlay: true, scrollDirection: Axis.vertical,autoPlayInterval: const Duration(seconds: 4), autoPlayAnimationDuration: const Duration(milliseconds: 100)),
                        items: [1,2,3,4,5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                width: double.infinity,
                                decoration:
                                BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                                // margin: const EdgeInsets.only(left: 10),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.announcement,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 16),
                                    // Container(child: Text("123")),
                                    Expanded(child: TextScroll(
                                      'This is the sample text for Flutter TextScroll widget widget widget widget widget widget .',
                                      mode: TextScrollMode.endless,
                                      velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                                      delayBefore: Duration(milliseconds: 40),
                                      numberOfReps: 5,
                                      pauseBetween: Duration(milliseconds: 1),
                                      style: TextStyle(color: Colors.green),
                                      textAlign: TextAlign.right,
                                      selectable: true,
                                    ))
                                    ,
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      )),*/

            // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，
            // 可以在 child 属性加入需要展示的部件
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate((_, index) {
                  BProductEntity bProduct = provider.bProducts![index];
                  bProduct.cAmount = bProduct.cAmount! > 0 ? bProduct.cAmount : provider.aUser!.fCreditAmount!;
                  bool productLock = userProducts != null ? !userProducts.split(',').contains(bProduct.id.toString()) : true;
                  bool creditFractionLock =
                      bProduct.qUnlockCreditFraction != null && bProduct.qUnlockCreditFraction! > 0 && bProduct.qUnlockCreditFraction! > creditFraction
                          ? true
                          : false;
                  bool overdueLock =
                      bProduct.tMaxOverdueTimes != null && bProduct.tMaxOverdueTimes! > 0 && overdueTimes > bProduct.tMaxOverdueTimes! ? true : false;
                  bool repayMaxOverdueDaysLock =
                      bProduct.sMaxOverdueDays != null && bProduct.sMaxOverdueDays! > 0 && repayMaxOverdueDays > bProduct.sMaxOverdueDays! ? true : false;
                  bool lock = productLock || creditFractionLock || overdueLock || repayMaxOverdueDaysLock;
                  return ProductWidget(
                      key: Key(bProduct.id.toString()),
                      bProduct: bProduct,
                      lock: lock,
                      yIndexAction: yIndexAction,
                      onPressed: (id, indexAction) {
                        _next(id, indexAction);
                      },
                      actionRoute: provider.actionRoute);
                }, childCount: provider.bProducts?.length ?? 0),
                itemExtent: 250.0),
          ]);

          // ])
          ;
          return CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              title: const Text('this is .'),
              centerTitle: true,
              // 展开的高度
              expandedHeight: 268.0,
              // 强制显示阴影
              forceElevated: false,
              // 设置该属性，当有下滑手势的时候，就会显示 AppBar
//        floating: true,
              // 该属性只有在 floating 为 true 的情况下使用，不然会报错
              // 当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
              // 当下滑到一定比例，会自动把 AppBar 展开
//        snap: true,
              // 设置该属性使 Appbar 折叠后不消失
//        pinned: true,
              // 通过这个属性设置 AppBar 的背景
              flexibleSpace: FlexibleSpaceBar(
//          title: Text('Expanded Title'),
                // 背景折叠动画
                collapseMode: CollapseMode.parallax,
                background: Container(
                  color: Colors.blue[100],
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 240.0,
                      aspectRatio: 18 / 9,
                      enlargeCenterPage: false,
                      viewportFraction: 1.1,
                      autoPlay: true,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                        child: Center(child: Image.network(images[index], fit: BoxFit.cover, width: 1000)),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: CarouselSlider(
              options: CarouselOptions(
                  height: 40.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1.1,
                  autoPlay: true,
                  scrollDirection: Axis.vertical,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 100)),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                      // margin: const EdgeInsets.only(left: 10),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.announcement,
                            color: Colors.white,
                          ),
                          SizedBox(width: 16),
                          // Container(child: Text("123")),
                          Expanded(
                              child: TextScroll(
                            'This is the sample text for Flutter TextScroll widget widget widget widget widget widget .',
                            mode: TextScrollMode.endless,
                            velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                            delayBefore: Duration(milliseconds: 40),
                            numberOfReps: 5,
                            pauseBetween: Duration(milliseconds: 1),
                            style: TextStyle(color: Colors.green),
                            textAlign: TextAlign.right,
                            selectable: true,
                          )),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            )),

            // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，
            // 可以在 child 属性加入需要展示的部件
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate((_, index) {
                  BProductEntity bProduct = provider.bProducts![index];
                  bProduct.cAmount = bProduct.cAmount! > 0 ? bProduct.cAmount : provider.aUser!.fCreditAmount!;
                  bool productLock = userProducts != null ? !userProducts.split(',').contains(bProduct.id.toString()) : true;
                  bool creditFractionLock =
                      bProduct.qUnlockCreditFraction != null && bProduct.qUnlockCreditFraction! > 0 && bProduct.qUnlockCreditFraction! > creditFraction
                          ? true
                          : false;
                  bool overdueLock =
                      bProduct.tMaxOverdueTimes != null && bProduct.tMaxOverdueTimes! > 0 && overdueTimes > bProduct.tMaxOverdueTimes! ? true : false;
                  bool repayMaxOverdueDaysLock =
                      bProduct.sMaxOverdueDays != null && bProduct.sMaxOverdueDays! > 0 && repayMaxOverdueDays > bProduct.sMaxOverdueDays! ? true : false;
                  bool lock = productLock || creditFractionLock || overdueLock || repayMaxOverdueDaysLock;
                  return ProductWidget(
                      key: Key(bProduct.id.toString()),
                      bProduct: bProduct,
                      lock: lock,
                      yIndexAction: yIndexAction,
                      onPressed: (id, indexAction) {
                        _next(id, indexAction);
                      },
                      actionRoute: provider.actionRoute);
                }, childCount: provider.bProducts?.length ?? 0),
                itemExtent: 250.0),
          ]);
          /*SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                // ignore: unnecessary_null_comparison
                // itemCount: provider.index1entity.bProducts?.length,
                itemCount: provider.bProducts?.length ?? 0,
                // itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                      // return ListTile(title: Text("$index"));
                  BProductEntity bProduct = provider.bProducts![index];
                  bProduct.cAmount = bProduct.cAmount! > 0 ? bProduct.cAmount : provider.aUser!.fCreditAmount!;
                  bool productLock = userProducts != null ? !userProducts.split(',').contains(bProduct.id.toString()) : true;
                  bool creditFractionLock =
                      bProduct.qUnlockCreditFraction != null && bProduct.qUnlockCreditFraction! > 0 && bProduct.qUnlockCreditFraction! > creditFraction
                          ? true
                          : false;
                  bool overdueLock =
                      bProduct.tMaxOverdueTimes != null && bProduct.tMaxOverdueTimes! > 0 && overdueTimes > bProduct.tMaxOverdueTimes! ? true : false;
                  bool repayMaxOverdueDaysLock =
                      bProduct.sMaxOverdueDays != null && bProduct.sMaxOverdueDays! > 0 && repayMaxOverdueDays > bProduct.sMaxOverdueDays! ? true : false;
                  bool lock = productLock || creditFractionLock || overdueLock || repayMaxOverdueDaysLock;
                  return ProductWidget(
                      key: Key(bProduct.id.toString()),
                      bProduct: bProduct,
                      lock: lock,
                      yIndexAction: yIndexAction,
                      onPressed: (id, indexAction) {
                        _next(id, indexAction);
                      },
                      actionRoute: provider.actionRoute);
                }

                  // children: <Widget>[
                  //   Gaps.vGap5,
                  //   _buildCard(),
                  //   Gaps.vGap5,
                  // ],
                ),
              )*/
        }),
      ),
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

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
