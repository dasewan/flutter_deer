import 'package:flutter/material.dart';

///
class Progressoo extends StatefulWidget {
  /// The starting position of the progress bar. Defaults to 0.0 must be less
  /// than 1.0
  final double start;

  /// The progress position of the progress bar. Defaults to 0.0 must be less
  /// than 1.0 and greater than start.
  final double progress;

  /// a List of double values that are represented on the progress line as
  /// points. Must be greater than or equal to 0.0 and less than or equal to 1.0
  final List<double> points;

  /// The Color of the progress bar
  final Color progressColor;

  /// The color of the background bar
  final Color backgroundColor;

  /// The stroke width of the progress bar
  final double progressStrokeWidth;

  /// The cap style of the progress bar. Defaults to square, options include
  /// StrokeCap.round, StrokeCap.square, StrokeCap.butt
  final StrokeCap progressStrokeCap;

  ///the stroke width of the background bar
  final double backgroundStrokeWidth;

  /// The cap style of the progress bar. Defaults to square, options include
  /// StrokeCap.round, StrokeCap.square, StrokeCap.butt
  final StrokeCap backgroundStrokeCap;

  /// The Color of the outer circle of the points given in the points parameter
  /// defaults to Colors.blue
  final Color pointColor;
  final Color pointColor2;

  /// The Color of the outer circle of the points given in the points parameter
  /// defaults to Colors.white
  final Color pointInnerColor;
  final Color pointInnerColor2;

  /// The radius of the outer circle of the points given in the points parameter
  /// defaults to 7.5
  final double pointRadius;

  /// The radius of the inner circle of the points given in the points parameter
  /// defaults to 2.5
  final double pointInnerRadius;

  Progressoo(
      {Key? key,
      this.start = 0.0,
      this.progress = 0.0,
      this.progressColor = Colors.blue,
      this.backgroundColor = Colors.grey,
      this.progressStrokeWidth = 10.0,
      this.backgroundStrokeWidth = 5.0,
      this.progressStrokeCap = StrokeCap.square,
      this.backgroundStrokeCap = StrokeCap.square,
      this.pointColor = Colors.blue,
      this.pointColor2 = Colors.grey,
      this.pointInnerColor = Colors.white,
      this.pointInnerColor2 = Colors.white70,
      this.pointRadius = 7.5,
      this.pointInnerRadius = 2.5,
      this.points = const []})
      : super(key: key);

  @override
  _ProgressooState createState() => _ProgressooState();
}

class _ProgressooState extends State<Progressoo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 创建动画控制器
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // 创建动画
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    // 播放动画
    _controller.repeat(reverse: true); // 反向重复播放动画
  }

  @override
  void dispose() {
    _controller.dispose(); // 释放动画控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _ProgressoPainter(
          progress: widget.progress,
          start: widget.start,
          progressColor: widget.progressColor,
          backgroundColor: widget.backgroundColor,
          progressStrokeWidth: widget.progressStrokeWidth,
          progressStrokeCap: widget.progressStrokeCap,
          backgroundStrokeWidth: widget.backgroundStrokeWidth,
          backgroundStrokeCap: widget.backgroundStrokeCap,
          pointColor: widget.pointColor,
          pointColor2: widget.pointColor2,
          pointInnerColor: widget.pointInnerColor,
          pointInnerColor2: widget.pointInnerColor2,
          pointRadius: widget.pointRadius,
          pointInnerRadius: widget.pointInnerRadius,
          points: widget.points),
      child: Center(),
      painter: DotPainter(_animation.value),
    );
  }
}

class _ProgressoPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintProgress = new Paint();
  final Paint _paintPoint = new Paint();
  final Paint _paintPointCenter = new Paint();

  final Paint _paintPoint2 = new Paint();
  final Paint _paintPointCenter2 = new Paint();
  final Color backgroundColor;
  final Color progressColor;
  final double start;
  final double progress;
  final double progressStrokeWidth;
  final StrokeCap progressStrokeCap;
  final double backgroundStrokeWidth;
  final StrokeCap backgroundStrokeCap;
  final Color pointColor;
  final Color pointColor2;
  final Color pointInnerColor;
  final Color pointInnerColor2;
  final double pointRadius;
  final double pointInnerRadius;
  final List<double> points;

  _ProgressoPainter(
      {required this.start,
      required this.progress,
      required this.progressColor,
      required this.backgroundColor,
      required this.progressStrokeWidth,
      required this.progressStrokeCap,
      required this.backgroundStrokeWidth,
      required this.backgroundStrokeCap,
      required this.points,
      required this.pointColor,
      required this.pointColor2,
      required this.pointInnerColor,
      required this.pointInnerColor2,
      required this.pointInnerRadius,
      required this.pointRadius}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeCap = backgroundStrokeCap;
    _paintBackground.strokeWidth = backgroundStrokeWidth;

    _paintProgress.color = progressColor;
    _paintProgress.style = PaintingStyle.stroke;
    _paintProgress.strokeCap = progressStrokeCap;
    _paintProgress.strokeWidth = progressStrokeWidth;
    _paintPoint.color = pointColor;
    _paintPoint.style = PaintingStyle.fill;
    _paintPointCenter.color = pointInnerColor;
    _paintPointCenter.style = PaintingStyle.fill;

    _paintPoint2.color = pointColor2;
    _paintPoint2.style = PaintingStyle.fill;
    _paintPointCenter2.color = pointInnerColor2;
    _paintPointCenter2.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final startOffset = Offset(0.0, size.height / 2);
    final endOffset = Offset(size.width, size.height / 2);
    canvas.drawLine(startOffset, endOffset, _paintBackground);
    final xStart = size.width * start;
    var cappedProgress = progress;
    if (progress > 1) {
      cappedProgress = 1.0;
    }
    var xProgress = size.width * cappedProgress;
    final progressStart = Offset(xStart, size.height / 2);
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white70, Colors.white],
    );
    _paintProgress.shader = gradient.createShader(rect);
    canvas.drawLine(progressStart, Offset(xProgress, size.height / 2), _paintProgress);
    for (var point in points) {
      var pointPos = size.width * point;
      final pointX = Offset(pointPos, size.height / 2);
      if (point <= progress) {
        print("123");
        canvas.drawCircle(pointX, pointRadius, _paintPoint);
        canvas.drawCircle(pointX, pointInnerRadius, _paintPointCenter);
      } else {
        print("456");
        canvas.drawCircle(pointX, pointRadius, _paintPoint2);
        canvas.drawCircle(pointX, pointInnerRadius, _paintPointCenter2);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final old = oldDelegate as _ProgressoPainter;
    return old.progress != this.progress ||
        old.start != this.start ||
        old.progressColor != this.progressColor ||
        old.backgroundColor != this.backgroundColor ||
        old.progressStrokeWidth != this.progressStrokeWidth ||
        old.backgroundStrokeWidth != this.backgroundStrokeWidth ||
        old.progressStrokeCap != this.progressStrokeCap ||
        old.backgroundStrokeCap != this.backgroundStrokeCap ||
        old.pointColor != this.pointColor ||
        old.pointInnerColor != this.pointInnerColor ||
        old.pointRadius != this.pointRadius ||
        old.pointInnerRadius != this.pointInnerRadius ||
        old.points != this.points;
  }
}

class DotPainter extends CustomPainter {
  final double progress;

  DotPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    double radius = size.width * 5;

    canvas.drawCircle(Offset(radius, radius), radius * progress, paint);
  }

  @override
  bool shouldRepaint(DotPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
