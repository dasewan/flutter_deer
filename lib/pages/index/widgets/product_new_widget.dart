import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp9/providers/user_provider.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/other_utils.dart';
import 'package:provider/provider.dart';

import '../../../config/constant.dart';
import '../../../models/index_entity.dart';
import '../../../providers/index_new_provider.dart';
import '../../../providers/product_new_provider.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/my_button.dart';
import 'money_widget.dart';

class ProductNewWidget extends StatefulWidget {
  const ProductNewWidget({
    Key? key,
    required this.bProduct,
    required this.dBorrow,
    required this.backTips,
    required this.features,
    required this.onPressed,
    this.noAction = false,
  }) : super(key: key);

  final IndexDataBProducts bProduct;
  final IndexDataDBorrows? dBorrow;
  final List<IndexDataBackTips> backTips;
  final List<IndexDataBCProductFeatures> features;
  final bool noAction;
  final Function(int, String) onPressed;

  @override
  _ProductNewWidgetState createState() => _ProductNewWidgetState();
}

class _ProductNewWidgetState extends State<ProductNewWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(end: 1.0, begin: 0).animate(_animationController)
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String btnText = "DETAIL";
    bool btnClickable = true;
    Color btnBackgroundColor = Colours.app_main;
    Color btnBackgroundColor2 = Colors.blue[50]!;
    List<String> tags = [];
    Color tagColor = Colors.blue;
    Color tagBackgroundColor = Colors.blue[50]!;
    String amountLabel = "Max Loan Amount";
    String tips = "Apply now for funds in as fast as 10 minutes.";
    double tipFontSize = 10;
    String rightLabel = "Loan Terms";
    String backTips = '';
    String productBackground = 'product_reviewing.png';
    String action = '';

    RichText right = RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
        children: <TextSpan>[
          TextSpan(
            text: widget.bProduct.zPeriod! > 1 ? '${widget.bProduct.zPeriod}×' : '',
            style: const TextStyle(color: Colors.black54, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
          ),
          TextSpan(
            text: widget.bProduct.eLife.toString(),
            style: const TextStyle(color: Colors.black54, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
          ),
          TextSpan(
            text: widget.bProduct.dUnit == 'd' ? ' Days' : (widget.bProduct.dUnit == 'w' ? 'Week' : 'Month'),
            style: const TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
          )
        ],
      ),
    );
    if (widget.dBorrow != null && widget.dBorrow!.jStatus != Constant.borrow_closed && widget.dBorrow!.jStatus != Constant.borrow_cleared) {
      if (Constant.shenhezhong.contains(widget.dBorrow!.kSubStatus!)) {
        /// 订单审核中
        if (widget.bProduct.aEFeatures != null && widget.bProduct.aEFeatures != '') {
          tags = widget.bProduct.aEFeatures!.split(',').map((id) {
            return widget.features.firstWhere((feature) => feature.id == int.parse(id)).bTitle!;
          }).toList();
        }
        String dateString = widget.dBorrow!.aUStatusTime!;
        DateTime dateTime = DateTime.parse(dateString);
        DateTime now = DateTime.now();
        String formattedTime = DateFormat.jm().format(dateTime);
        String reviewTime;
        if (dateTime.day == now.day && dateTime.month == now.month && dateTime.year == now.year) {
          reviewTime = "Today $formattedTime";
        } else {
          reviewTime = "Tomorrow $formattedTime";
        }
        btnText = "Under Review";
        btnClickable = false;
        btnBackgroundColor = Colors.teal[200]!;
        btnBackgroundColor2 = Colors.teal[50]!;
        tips = 'Your application review will be done by $reviewTime. Please be patient.';
        backTips = widget.backTips.firstWhere((backTipsTmp) => backTipsTmp.aType == 'reviewing').bContent!;
      } else if (Constant.yijujue.contains(widget.dBorrow!.kSubStatus!)) {
        /// 订单已拒绝
        if (widget.bProduct.aEFeatures != null && widget.bProduct.aEFeatures != '') {
          tags = widget.bProduct.aEFeatures!.split(',').map((id) {
            return widget.features.firstWhere((feature) => feature.id == int.parse(id)).bTitle!;
          }).toList();
        }
        IndexDataAUser user = Provider.of<IndexNewProvider>(context).aUser;
        List<int> canProductIdList = user.nProducts!.split(',').map((stringNumber) => int.parse(stringNumber)).toList();
        bool lock = !(canProductIdList.contains(widget.bProduct.id));
        // 是否已经过了冷静期
        bool notPassCoolTime = false;
        String dateString = widget.dBorrow!.aUStatusTime!;
        DateTime date = DateTime.parse(dateString);
        DateTime today = DateTime.now();
        DateTime todayStart = DateTime(today.year, today.month, today.day);
        if (!todayStart.isAfter(date)) {
          notPassCoolTime = true;
        }
        if (!notPassCoolTime && !lock) {
          btnText = "Sign";
          action = 'sign';
        } else if (!notPassCoolTime && lock) {
          btnText = "Detail";
          btnClickable = false;
          btnBackgroundColor = Colors.grey[500]!;
          btnBackgroundColor2 = Colors.grey[100]!;
          backTips = widget.backTips.firstWhere((backTipsTmp) => backTipsTmp.aType == 'locked').bContent!;
          productBackground = 'product_locked.png';
        } else {
          btnText = "Application Rejected";
          btnBackgroundColor = Colors.grey[500]!;
          btnBackgroundColor2 = Colors.grey[100]!;
          btnClickable = false;
          tips =
              'Your application for this product is rejected. Reapply after ${DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.dBorrow!.aUStatusTime!))}.';
          backTips = widget.backTips.firstWhere((backTipsTmp) => backTipsTmp.aType == 'rejected').bContent!;
          productBackground = 'product_rejected.png';
        }
      } else if (Constant.fangkuanzhong.contains(widget.dBorrow!.kSubStatus!)) {
        /// 订单正在放款中
        if (widget.bProduct.aEFeatures != null && widget.bProduct.aEFeatures != '') {
          tags = widget.bProduct.aEFeatures!.split(',').map((id) {
            return widget.features.firstWhere((feature) => feature.id == int.parse(id)).bTitle!;
          }).toList();
        }
        btnText = "Funds On The Way";
        btnBackgroundColor = Colors.teal;
        btnBackgroundColor2 = Colors.teal[50]!;
        btnClickable = false;
        tips = 'Your loan is being disbursed. Please be patient.';
        backTips = widget.backTips.firstWhere((backTipsTmp) => backTipsTmp.aType == 'disturbing').bContent!;
        productBackground = 'product_disturbing.png';
      } else if (widget.dBorrow!.jStatus == Constant.borrow_outstanding) {
        /// 还款期
        // 将日期字符串解析为DateTime对象
        DateTime date = DateTime.parse(widget.dBorrow?.qExpectRepayTime as String);
        // 获取当前日期和时间
        DateTime now = DateTime.now();
        // 计算日期差异
        int differenceInDays = now.difference(date).inDays;
        btnText = "Repay";
        action = 'repay';
        tags = ['There are $differenceInDays days left until the due date.'];
        tagColor = Colors.green;
        tagBackgroundColor = Colors.green[50]!;
        amountLabel = "Loan Amount";
        tips = 'Contact us';
        rightLabel = "Due Date";
        right = RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
            children: <TextSpan>[
              TextSpan(
                text: DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.dBorrow?.qExpectRepayTime as String)),
                style: const TextStyle(color: Colors.black54, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
              )
            ],
          ),
        );
      } else if (widget.dBorrow!.jStatus == Constant.borrow_overdue) {
        /// 逾期
        btnText = "Repay";
        action = 'repay';
        btnBackgroundColor = Colours.red;
        btnBackgroundColor2 = Colors.red[50]!;
        tags = ['You are ${widget.dBorrow?.aIOverdueDays} days overdue '];
        tagColor = Colors.red;
        tagBackgroundColor = Colors.red[50]!;
        amountLabel = "Loan Amount";
        tips = 'Pay off this loan and you can get more borrowings.';
        rightLabel = "Due Date";
        right = RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
            children: <TextSpan>[
              TextSpan(
                text: DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.dBorrow?.qExpectRepayTime as String)),
                style: const TextStyle(color: Colors.black54, fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
              )
            ],
          ),
        );
      }
    } else {
      if (widget.bProduct.aEFeatures != null && widget.bProduct.aEFeatures != '') {
        tags = widget.bProduct.aEFeatures!.split(',').map((id) {
          return widget.features.firstWhere((feature) => feature.id == int.parse(id)).bTitle!;
        }).toList();
      }
      IndexDataAUser user = Provider.of<IndexNewProvider>(context).aUser;

      if (user.iIndexAction == 11) {
        /// 创建认证
        btnText = "Apply";
        action = 'create_verify';
        amountLabel = "Max Loan Amount";
        tips = 'Authentication is required prior to borrowing.';
      } else if (user.iIndexAction == 12) {
        /// 继续认证
        btnText = "Apply";
        action = 'verify_list';
        amountLabel = "Max Loan Amount";
        tips = 'Authentication is required prior to borrowing.';
      } else if (user.iIndexAction == 13) {
        /// 活体
        btnText = "Liveness";
        action = 'liveness';
        tips = 'Authentication is required prior to borrowing.';
      } else if (user.iIndexAction == 14) {
        // 是否包含用户可借产品
        List<int> canProductIdList = user.nProducts!.split(',').map((stringNumber) => int.parse(stringNumber)).toList();
        bool lock1 = !(canProductIdList.contains(widget.bProduct.id));
        // 信用分是否满足
        bool lock2 = user.gCreditFraction! < widget.bProduct.qUnlockCreditFraction!;
        bool lock3 = user.aFLoanCount! < widget.bProduct.rSettledTimes!;
        bool lock4 = user.aHOverdueTimes! > widget.bProduct.tMaxOverdueTimes!;
        bool lock5 = user.aIRepayMaxOverdueDays! > widget.bProduct.sMaxOverdueDays! as bool;
        bool lock = lock1 || lock2 || lock3 || lock4 || lock5;
        //所有订单
        List<IndexDataDBorrows> borrows = Provider.of<IndexNewProvider>(context).dBorrows;
        // 在途订单总数（审核中，审核拒绝（未到冷静期）, 放款中，放款失败，放款拦截，未到期，逾期）
        int borrowingCount = borrows.where((element) {
          bool notPassCoolTime = false;
          if (Constant.yijujue.contains(element.kSubStatus!)) {
            String dateString = element.aUStatusTime!;
            DateTime date = DateTime.parse(dateString);
            DateTime today = DateTime.now();
            DateTime todayStart = DateTime(today.year, today.month, today.day);
            if (!todayStart.isAfter(date)) {
              notPassCoolTime = true;
            }
          }
          return [...Constant.shenhezhong, ...Constant.fangkuanzhong].contains(element.kSubStatus) ||
              [Constant.borrow_outstanding, Constant.borrow_overdue].contains(element.jStatus);
        }).length;

        bool canApply = false;
        if (borrowingCount < user.vMaxCount!) {
          canApply = true;
        }
        if (!lock) {
          if (canApply) {
            /// 签约
            btnText = "Sign";
            action = 'sign';
          } else {
            btnText = "Detail";
            backTips = widget.backTips.firstWhere((backTipsTmp) => backTipsTmp.aType == 'max_processing').bContent!;
            productBackground = 'product_max_processing.png';
            btnBackgroundColor = Colors.grey[500]!;
            btnBackgroundColor2 = Colors.grey[100]!;
            btnClickable = false;
          }
        } else {
          btnText = "UnLock";
          backTips = widget.backTips.firstWhere((backTipsTmp) => backTipsTmp.aType == 'locked').bContent!;
          productBackground = 'product_locked.png';
          btnBackgroundColor = Colors.grey[500]!;
          btnBackgroundColor2 = Colors.grey[100]!;
          btnClickable = false;
        }
      }
    }

    final TextStyle? textTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12, color: Colors.white);
    final TextStyle? textTextStyle2 = Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white);
    final Widget front = AspectRatio(
      aspectRatio: 1.37,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0.0),
          // padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Selector<IndexNewProvider, int?>(selector: (_, provider) {
            return provider.indexAction;
          }, shouldRebuild: (previous, next) {
            return previous != next && [11, 12, 13, 14].contains(previous) && [11, 12, 13, 14].contains(next);
          }, builder: (_, indexAction, __) {
            int randomInt = Random().nextInt(3);
            print(randomInt);
            if (indexAction == 11) {
              /// 创建认证
              btnText = "Apply";
              action = 'create_verify';
              amountLabel = "Max Loan Amount";
              tips = 'Authentication is required prior to borrowing.';
            } else if (indexAction == 12) {
              /// 继续认证
              btnText = "Apply";
              action = 'verify_list';
              amountLabel = "Max Loan Amount";
              tips = 'Authentication is required prior to borrowing.';
            } else if (indexAction == 13) {
              /// 活体
              btnText = "Liveness";
              action = 'liveness';
              tips = 'Authentication is required prior to borrowing.';
            }
            return Column(
              children: <Widget>[
                Gaps.vGap12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gaps.hGap8,
                    // LoadAssetImage('merchant/m${Random().nextInt(6)}', width: 80),
                    CachedNetworkImage(
                      width: 80,
                      imageUrl: "${widget.bProduct.aFPic}",
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          SizedBox(width: 55, height: 55, child: CircularProgressIndicator(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => LoadAssetImage('placeholder3', width: 80),
                    ),
                    Gaps.hGap10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.bProduct.bName.nullSafe,
                            style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
                          ),
                          tagsWidget(tags, tagColor, tagBackgroundColor),
                        ],
                      ),
                    )
                  ],
                ),
                Gaps.vGap15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MoneyWidget(
                      title: amountLabel,
                      money: widget.bProduct.cAmount ?? 0,
                      alignment: MainAxisAlignment.end,
                      moneyTextStyle: TextStyle(color: Colors.deepOrange[400], fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        /// 横向撑开Column，扩大语义区域
                        // const SizedBox(width: double.infinity),
                        right,
                        Gaps.vGap4,
                        Text(rightLabel, style: const TextStyle(color: Colors.grey, fontSize: Dimens.font_sp14)),
                      ],
                    ),
                  ],
                ),
                Gaps.vGap16,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.6, color: Colors.white),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: MyButton(
                    textColor: Colors.white,
                    backgroundColor: btnBackgroundColor,
                    radius: 23.0,
                    minWidth: 300,
                    onPressed: () {
                      if (!btnClickable && _animationStatus == AnimationStatus.dismissed) {
                        _animationController.forward();
                      } else {
                        context.read<ProductNewProvider>().setBProductEntity(widget.bProduct);
                        widget.onPressed(widget.bProduct.id!, action);
                      }
                    },
                    text: btnText,
                  ),
                ),
                Gaps.vGap4,
                Expanded(child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                    decoration: BoxDecoration(
                      color: btnBackgroundColor2,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                    ),
                    child: Text(tips, style: TextStyle(color: btnBackgroundColor, fontSize: tipFontSize, fontWeight: FontWeight.w500)))),
              ],
            );
          })),
    );
    final Widget back = AspectRatio(
      aspectRatio: 1.48,
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(pi),
        child: InkWell(
          onTap: () {
            if (_animationStatus == AnimationStatus.completed) {
              _animationController.reverse();
            }
          },
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0.0),
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/index/$productBackground'), // 替换为你的背景图路径
                  fit: BoxFit.fitHeight, // 调整图片适应容器大小
                  opacity: 0.25,
                  // repeat: ImageRepeat.repeat,
                ),
              ),
              child: Consumer<UserProvider>(builder: (_, provider, __) {
                int randomInt = Random().nextInt(3);

                return Column(
                  children: <Widget>[
                    Gaps.vGap12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gaps.hGap8,
                        CachedNetworkImage(
                          width: 80,
                          imageUrl: "${widget.bProduct.aFPic}",
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              SizedBox(width: 55, height: 55, child: CircularProgressIndicator(value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => LoadAssetImage('placeholder3', width: 80),
                        ),
                        Gaps.hGap10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.bProduct.bName.nullSafe,
                                style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
                              ),
                              tagsWidget(tags, tagColor, tagBackgroundColor),
                            ],
                          ),
                        )
                      ],
                    ),
                    Gaps.vGap4,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            /*                       image: DecorationImage(
                            image: AssetImage('assets/images/index/$productBackground'), // 替换为你的背景图路径
                            fit: BoxFit.fitHeight, // 调整图片适应容器大小
                            opacity: 0.1,
                            repeat: ImageRepeat.repeat,
                          ),*/
                            ),
                        padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 14.0),
                        child: Text(
                          backTips,
                          style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Gaps.vGap16,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.6, color: Colors.white),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: MyButton(
                        textColor: Colors.white,
                        backgroundColor: btnClickable ? btnBackgroundColor : Colors.grey[500],
                        radius: 23.0,
                        minWidth: 260,
                        onPressed: () {
                          if (_animationStatus == AnimationStatus.completed) {
                            _animationController.reverse();
                          }
                        },
                        text: btnText,
                      ),
                    ),
                    Gaps.vGap4,
                  ],
                );
              })),
        ),
      ),
    );
    // return front;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/index/$productBackground'), // 替换为你的背景图路径
          fit: BoxFit.fitHeight, // 调整图片适应容器大小
          opacity: 0.7,
          // repeat: ImageRepeat.repeat,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 2.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(pi * _animation.value),
            child: _animation.value <= 0.5 ? front : back,
          );
        },
      ),
    );
  }

  Widget tagsWidget(List<String> tags, Color tagColor, Color tagBackgroundColor) {
    return Container(
      child: Wrap(
        spacing: 3.0, // 主轴(水平)方向间距
        runSpacing: 3.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.start, //沿主轴方向居中
        children: tags
            .map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                decoration: BoxDecoration(
                  color: tagBackgroundColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  tag,
                  style: TextStyle(color: tagColor, fontSize: Dimens.font_sp10),
                )))
            .toList(),
      ),
    );
  }
}


