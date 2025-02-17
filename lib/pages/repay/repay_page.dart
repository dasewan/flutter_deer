import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp9/mvp/base_page.dart';
import 'package:myapp9/pages/repay/iviews/repay_i_mvp_view.dart';
import 'package:myapp9/pages/repay/presenters/repay_page_presenter.dart';
import 'package:myapp9/pages/repay/router/repay_router.dart';
import 'package:myapp9/pages/repay/widgets/period_item.dart';
import 'package:myapp9/pages/repay/widgets/product_widget.dart';
import 'package:myapp9/providers/repay_provider.dart';
import 'package:myapp9/routers/fluro_navigator.dart';
import 'package:myapp9/widgets/my_app_bar.dart';
import 'package:myapp9/widgets/my_button.dart';
import 'package:provider/provider.dart';

import '../../res/raw/colors.dart';
import '../../res/raw/gaps.dart';
import '../../util/device_utils.dart';
import '../../util/other_utils.dart';
import '../../widgets/load_image.dart';
import '../../widgets/my_card.dart';
import '../sign/widgets/confirm_dialog.dart';

class RepayPage extends StatefulWidget {
  const RepayPage({Key? key, required this.productId}) : super(key: key);
  final String productId;

  @override
  _RepayPageState createState() => _RepayPageState();
}

class _RepayPageState extends State<RepayPage> with BasePageMixin<RepayPage, RepayPagePresenter> implements RepayIMvpView {
  late RepayPagePresenter _repayPagePresenter;
  static const platform = MethodChannel('samples.flutter.io/battery');
  late List<bool> _selected = List.generate(10, (_) => false);
  late List<int> _selectedIds = [];
  late String _sn = '';
  late final List<int> _selectedAmountRange = [];
  late final List<int> _selectedPeriodRange = [];
  late Timer _timer;

  // late List<bool> _selected;
  int _selectedCount = 0;
  int _selectedTotalAmount = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _indexFirstPagePresenter.index(false);
    // });
  }

  @override
  RepayProvider provider = RepayProvider();

  @override
  RepayPagePresenter createPresenter() {
    _repayPagePresenter = RepayPagePresenter(widget.productId);
    return _repayPagePresenter;
  }

  @override
  void setInitial(List<bool> initialSelected, int initialSelectedCount, int initialSelectedAmount, List<int> initialSelectedIds, String sn) {
    setState(() {
      _selected = initialSelected;
      _selectedCount = initialSelectedCount;
      _selectedTotalAmount = initialSelectedAmount;
      _selectedIds = initialSelectedIds;
      _sn = sn;
    });
    scrollController.animateTo((initialSelectedCount + 1) * 200, duration: Duration(milliseconds: 1000 + (initialSelectedCount) * 100), curve: Curves.ease);
    Future.delayed(Duration(milliseconds: 1000 + (initialSelectedCount) * 100), () {
      scrollController.animateTo(
        0.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 400),
      );
    });
/*    _timer = Timer(Duration(seconds: 3), () {
      scrollController.animateTo(
        200,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });*/
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Future<bool> requestOpsPermission() async {
    Map<String, dynamic> arguments = <String, dynamic>{
      'type': "sms",
    };
    final bool has3 = await platform.invokeMethod('checkOpsPermission', arguments) as bool;
    if (!has3) {
      showCupertinoDialogSub(title: "SMS authorization", content: "Please go to system settings and authorize app SMS authorization");
    } else {
      return true;
    }
    return false;
  }

  void _launchWebURL(String title, String url) {
    if (Device.isMobile) {
      NavigatorUtils.goWebViewPage(context, title, url);
    } else {
      Utils.launchWebURL(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: 'Repayment',
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: CustomScrollView(controller: scrollController, slivers: <Widget>[
                SliverPersistentHeader(
                  // 属性同 SliverAppBar
                  pinned: true,
                  floating: true,
                  // 因为 SliverPersistentHeaderDelegate 是一个抽象类，所以需要自定义
                  delegate: CustomSliverPersistentHeaderDelegate(
                      max: 240.0,
                      min: 240.0,
                      child: ChangeNotifierProvider<RepayProvider>(
                          create: (_) => provider,
                          child: Consumer<RepayProvider>(builder: (_, provider, __) {
                            return Container(
                              color: Colors.white,
                              child: ProductWidget(
                                borrow: provider.borrow,
                                product: provider.product,
                                loan: provider.loan,
                                selectedCount: _selectedCount,
                                selectedAmount: _selectedTotalAmount,
                              ),
                            );
                          }))),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                    child: MyCard(
                      // color: isSelected ? Colors.blue[50] : Colors.white,
                      // shadowColor: Colors.black38,
                      shadowColor: Colors.blue[800],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => {},
                              child: Row(
                                children: <Widget>[
                                  const LoadAssetImage('shop/voting_10332492', width: 16.0, height: 16.0),
                                  Gaps.hGap10,
                                  const Text('Late repayments wil incur extra fees'),
                                  const Expanded(child: Gaps.empty),
                                ],
                              ),
                            ),
                            Gaps.vGap4,
                            InkWell(
                              onTap: () => {},
                              child: Row(
                                children: <Widget>[
                                  const LoadAssetImage('ywc_s', width: 16.0, height: 16.0),
                                  Gaps.hGap10,
                                  Text('You have paid ${provider.borrow!.uSettledPeriod!} out of ${provider.borrow!.aPPeriodCount!} installments so far.'),
                                  const Expanded(child: Gaps.empty),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ChangeNotifierProvider<RepayProvider>(
                    create: (_) => provider,
                    child: Consumer<RepayProvider>(builder: (_, provider, __) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: PeriodItem(
                                index: index,
                                isSelected: _selected[index],
                                period: provider.periods![index],
                                type: provider.product!.fSettlementType!,
                                totalCount: provider.product!.zPeriod!,
                                onSelect: (select) {
                                  if (select) {
                                    for (var i = 0; i <= index; i++) {
                                      _selected[i] = true;
                                    }
                                  } else {
                                    for (var i = index; i < _selected.length; i++) {
                                      _selected[i] = false;
                                    }
                                  }
                                  _selectedCount = _selected.where((element) => element == true).length;
                                  if (_selectedCount == 0) {
                                    _selected[0] = true;
                                    _selectedCount = 1;
                                  }
                                  _selectedTotalAmount = 0;
                                  _selectedAmountRange.clear();
                                  _selectedPeriodRange.clear();
                                  for (var i = 0; i < _selectedCount; i++) {
                                    _selectedIds.add(provider.periods![i].id!);
                                    int _periodShouldRepayAmount = provider.periods![i].fExpectRepayTotalAmount! - provider.periods![i].pPaidInterest! - provider.periods![i].qPaidServiceFee! - provider.periods![i].sPaidOverdueAmount! - provider.periods![i].oPaidBorrowAmount!;
                                    _selectedTotalAmount += _periodShouldRepayAmount;
                                    _selectedAmountRange.add(_periodShouldRepayAmount);
                                    _selectedPeriodRange.add(provider.periods![i].dIndex!);
                                  }
                                  setState(() {});
                                  if (index < provider.periods!.length - 1 && select) {
                                    scrollController.animateTo((index + 1) * 200, duration: Duration(seconds: 1), curve: Curves.ease);
                                  }
                                },
                              ),
                            );
                          },
                          childCount: provider.periods != null ? provider.periods!.length : 0,
                        ),
                      );
                    })),
              ]),
            ),
          ),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 6.0, top: 6.0),
            child: FractionallySizedBox(
              widthFactor: 0.9, // 宽度比例为50%
              child: Column(
                children: [
                  MyButton(
                    radius: 33.0,
                    backgroundColor: provider.borrow?.jStatus == 90 ? Colors.redAccent[700] : Colours.app_main,
                    onPressed: () {
                      // 获取当前时间戳（以毫秒为单位）
                      final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
                      // 计算当前时间戳所在的十分钟区间
                      const int tenMinutesInMillis = 10 * 60 * 1000; // 十分钟的毫秒数
                      final int startOfTenMinuteInterval = (currentTimestamp ~/ tenMinutesInMillis) * tenMinutesInMillis;
                      // 输出结果
                      _launchWebURL('Repayment', 'https://api.dasewan.cn/checkout/?amount=$_selectedTotalAmount&sn=$_sn&t=$startOfTenMinuteInterval');
                      // NavigatorUtils.push(context,
                      //     '${RepayRouter.bank}?productId=${widget.productId}&payType=settled&amount=$_selectedTotalAmount&sn=$_sn&periods=${_selectedIds.join(',')}',
                      //     clearStack: false);
                    },
                    text: 'Repay',
                  ),
                  Gaps.vGap5,
                  // const Text('Have difficulties? Pay in part now or Extend'),
                  ChangeNotifierProvider<RepayProvider>(
                      create: (_) => provider,
                      child: Consumer<RepayProvider>(builder: (_, provider, __) {
                        return provider.product?.mCanPartPay == 'y' || provider.borrow?.yShowExtendBtn == 1
                            ? RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: 'Have difficulties? ', style: Theme.of(context).textTheme.bodySmall),
                                    if (provider.product?.mCanPartPay == 'y') TextSpan(
                                            text: 'Pay in part now',
                                            style: const TextStyle(
                                              color: Colors.blueAccent,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // 获取当前时间戳（以毫秒为单位）
                                                final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
                                                // 计算当前时间戳所在的十分钟区间
                                                const int tenMinutesInMillis = 10 * 60 * 1000; // 十分钟的毫秒数
                                                final int startOfTenMinuteInterval = (currentTimestamp ~/ tenMinutesInMillis) * tenMinutesInMillis;
                                                int part_minimal_repay_amount = _selectedTotalAmount > 1000 ? 1000 : _selectedTotalAmount;
                                                // 输出结果
                                                _launchWebURL('Repayment', 'https://api.dasewan.cn/part/?amount=$_selectedTotalAmount&sn=$_sn&part_minimal_repay_amount=$part_minimal_repay_amount&should_repay_amount=$_selectedTotalAmount&part_step=100&t=$startOfTenMinuteInterval');
          /*                                      NavigatorUtils.push(context,
                                                    '${RepayRouter.partPay}?productId=${widget.productId}&min=${provider.product?.lMinPay}&step=${provider.product?.lMinPay}&amountRange=${_selectedAmountRange.join(',')}&periodRange=${_selectedPeriodRange.join(',')}',
                                                    clearStack: false);*/
                                              },
                                          ) else const TextSpan(text: ''),
                              provider.product?.mCanPartPay == 'y' && provider.borrow?.yShowExtendBtn == 1
                                        ? TextSpan(text: ' or ', style: Theme.of(context).textTheme.bodySmall)
                                        : const TextSpan(text: ''),
                              provider.borrow?.yShowExtendBtn == 1
                                        ? TextSpan(
                                            text: 'Extend',
                                            style: const TextStyle(
                                              color: Colors.blueAccent,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                _showBottomSheet(provider.borrow!.aTMaxExtendDays!, widget.productId);
                                              },
                                          )
                                        : const TextSpan(text: ''),
                                  ],
                                ),
                              )
                            : Gaps.empty;
                      })),
                  Gaps.vGap5,
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  String _sortName = '';
  final List<String> _list = [
    '1 Day',
    '2 Days',
    '3 Days',
    '4 Days',
    '5 Days',
    '6 Days',
    '7 Days',
    '8 Days',
    '9 Days',
    '10 Days',
    '11 Days',
    '12 Days',
    '13 Days',
    '14 Days'
  ];

  void _showBottomSheet(int maxExtendDays, String productId) {
    List<String> list2 = _list.take(maxExtendDays).toList();
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        // 可滑动ListView关闭BottomSheet
        return DraggableScrollableSheet(
          key: const Key('goods_sort'),
          initialChildSize: 0.7,
          minChildSize: 0.65,
          expand: false,
          builder: (_, scrollController) {
            return Column(
              children: [
/*                SizedBox(
                  height: 2,
                  child: FractionallySizedBox(
                      widthFactor:0.8,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Gaps.empty,
                      ),
                  ),
                ),*/
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: const Text(
                        'Select extend days',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                    Positioned(
                      right: 16.0,
                      top: 16.0,
                      bottom: 16.0,
                      child: Semantics(
                        label: 'close',
                        child: GestureDetector(
                          onTap: () => NavigatorUtils.goBack(context),
                          child: const LoadAssetImage(
                            'close',
                            key: Key('close'),
                            width: 16.0,
                            height: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemExtent: 48.0,
                    itemBuilder: (_, index) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 2),
                          // padding: const EdgeInsets.symmetric(horizontal: 26.0,vertical: 26),
                          alignment: Alignment.center,
                          child: Text(list2[index]),
                        ),
                        onTap: () {
                          NavigatorUtils.goBack(context);
                          setState(() {
                            _sortName = list2[index];
                          });
                          showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => ConfirmDialog(
                                    onPressed: (id) {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('确定展期 ${_sortName}吗？ 展期后应还款日期为2023-01-01'),
                                    ),
                                  ));

                          // NavigatorUtils.goBack(context);
                        },
                      );
                    },
                    itemCount: list2.length,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class CustomSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double max; // 最大高度
  final double min; // 最小高度
  final Widget child; // 需要展示的内容

  CustomSliverPersistentHeaderDelegate({required this.max, required this.min, required this.child})
  // 如果 assert 内部条件不成立，会报错
      : assert(max != null),
        assert(min != null),
        assert(child != null),
        assert(min <= max),
        super();

  // 返回展示的内容，如果内容固定可以直接在这定义，如果需要可扩展，这边通过传入值来定义
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override
  double get maxExtent => max; // 返回最大高度

  @override
  double get minExtent => min; // 返回最小高度

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    // 是否需要更新，这里我们定义当高度范围和展示内容被替换的时候进行刷新界面
    return max != oldDelegate.max || min != oldDelegate.min || child != oldDelegate.child;
  }
}
