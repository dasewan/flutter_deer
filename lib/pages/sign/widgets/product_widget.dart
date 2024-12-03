import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp9/pages/index/widgets/money_widget.dart';
import 'package:myapp9/res/resources.dart';
import 'package:myapp9/util/image_utils.dart';

import '../../../models/index_entity.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    required this.bProduct,
  }) : super(key: key);

  final IndexDataBProducts bProduct;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> with SingleTickerProviderStateMixin {
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
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? textTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12, color: Colors.white);
    final TextStyle? textTextStyle2 = Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white);
    final Widget front = AspectRatio(
      aspectRatio: 2.45,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ImageUtils.getAssetImage('index/bg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Gaps.vGap12,
            Text(
              'Loan Amount',
              style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
            ),
            MoneyWidget(
              title: '',
              money: widget.bProduct.cAmount ?? 0,
              alignment: MainAxisAlignment.end,
              moneyTextStyle: TextStyle(color: Colors.white, fontSize: 52.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
            ),
            Gaps.vGap4,
            Text(
              'Please read the loan details carefully and click Borrow after confirmation. ',
              style: const TextStyle(color: Colors.white, fontSize: 9.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin'),
            ),
            Gaps.vGap12
          ],
        ),
      ),
    );

    // return front;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(pi * _animation.value),
            child: front,
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
