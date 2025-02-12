import 'package:flutter/material.dart';
import 'package:myapp9/pages/shop/widgets/progerssoo.dart';
import 'package:myapp9/res/raw/gaps.dart';

import '../../../generated/center_entity.dart';
import '../../../util/other_utils.dart';

class LevelBar extends StatelessWidget {
  const LevelBar({super.key, required this.amountProgress, required this.levelProgress, required this.points, required this.tips, required this.progress});

  final List<CenterDataAmountProgress> amountProgress;
  final List<CenterDataLevelProgress> levelProgress;
  final List<double> points;
  final String tips;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      var _widgetSize = constraints.biggest;

      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        height: 106,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.grey.withOpacity(0.4), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 24,
                child: GridView.count(
                  crossAxisCount: 6,
                  childAspectRatio: 1.0,
                  padding: EdgeInsets.only(left: 1),
                  children: amountProgress.map((item) {
                    TextStyle textStyle = TextStyle(color: Colors.transparent);
                    if (item.amount! > 0 && item.type == 1 ) {
                      textStyle = const TextStyle(color: Colors.white54, fontSize: 11);
                    } else if (item.amount! > 0 && item.type == 2) {
                      textStyle = const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700);
                    }
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Text(Utils.formatPrice2(item.amount!),
                        style: textStyle,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: _widgetSize.width / 6 / 2, right: _widgetSize.width / 6 / 2),
                margin: EdgeInsets.only(bottom: 2),
                child: Progressoo(
                    progress: progress,
                    points: points,
                    pointRadius: 7,
                    progressStrokeWidth: 6,
                    backgroundStrokeWidth: 6,
                    // backgroundColor:Colors.lightBlueAccent,
                    // progressColor:Colors.red,
                    // pointInnerRadius: 1,
                    progressStrokeCap: StrokeCap.round,
                    backgroundStrokeCap: StrokeCap.round,
                    pointColor: Colors.lightGreen,
                    pointInnerColor: Colors.white),
              ),
              Container(
                height: 28,
                child: GridView.count(
                  crossAxisCount: 6,
                  childAspectRatio: 1.0,
                  padding: EdgeInsets.only(left: 1, top: 8),
                  children: levelProgress.map((item) {
                    TextStyle textStyle = const TextStyle(color: Colors.transparent);
                    if (item.level! != '' && item.type == 1) {
                      textStyle = const TextStyle(color: Colors.white54, fontSize: 10);
                    } else if (item.level! != '' && item.type == 2) {
                      textStyle = const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700);
                    }
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        item.level!,
                        style: textStyle,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Gaps.vGap5,
              Gaps.line,
              Gaps.vGap8,
              Row(
                children: [
                  Gaps.hGap5,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(tips, style: TextStyle(color: Colors.white, fontSize: 9)),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.indigoAccent.shade100,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(color: Color(0xFF00B6F0).withOpacity(0.5), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'learn more',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                letterSpacing: 0.0,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Gaps.hGap4,
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
