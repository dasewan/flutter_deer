import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // 引入intl包

// 简易实现数字滚动效果，控件能处理数超过1000时使用千位分隔符
class RiseNumberText extends StatefulWidget {
  const RiseNumberText(this.number,
      {Key? key, this.style, this.duration = 1000})
      : super(key: key);

  final num number;
  final TextStyle? style;
  final int duration;

  @override
  _RiseNumberTextState createState() => _RiseNumberTextState();
}

class _RiseNumberTextState extends State<RiseNumberText>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  num _fromNumber = 900;

  @override
  void initState() {
    super.initState();
    _fromNumber = widget.number - (widget.number*.1).ceil();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    final curve = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _animation = Tween<double>(begin: 0, end: 1).animate(curve);
    _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(RiseNumberText oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 数据变化时执行动画
    if (oldWidget.number != widget.number) {
      _fromNumber = oldWidget.number;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __){
        var number = _fromNumber + (_animation.value * (widget.number - _fromNumber));

        // 用千位分隔符来格式化数字
        String formattedNumber = NumberFormat("#,##0").format(number);

        return RichText(
          text: TextSpan(
            style: widget.style,
            children: <TextSpan>[
/*              TextSpan(
                  text: "\$ ",
                  style: TextStyle( fontSize: 18.0, )
              ),*/
              TextSpan(text: formattedNumber, style: widget.style)
            ],
          ),
        );
      },
    );
  }
}
