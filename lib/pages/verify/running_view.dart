import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/constant.dart';
import 'fitness_app_theme.dart';

class RunningView extends StatelessWidget {
  const RunningView({
    Key? key,
    required this.title,
    this.subtitle = '',
    this.onTap,
    this.status = 0,
    this.step = 'Step 01',
  }) : super(key: key);
  final GestureTapCallback? onTap;
  final String title;
  final String subtitle;
  final int status;
  final String step;
  static const Map<int, Icon> statusIcon = {
    Constant.notYet: Icon(
      CupertinoIcons.chevron_right,
      color: Color(0xFFE0E0E0),
      size: 22.0,
    ),
    Constant.wait: Icon(
      CupertinoIcons.chevron_right,
      size: 22.0,
    ),
    Constant.success: Icon(
      CupertinoIcons.checkmark_circle,
      color: Colors.green,
      size: 22.0,
    ),
    Constant.refuse: Icon(
      CupertinoIcons.multiply_circle,
      color: Colors.red,
      size: 22.0,
    ),
    Constant.review: Icon(
      CupertinoIcons.checkmark_circle,
      color: Colors.green,
      size: 22.0,
    ),
  };

  static const Map<int, Color> statusColor = {
    Constant.notYet: Color(0xFFFAFAFA),
    Constant.wait: Colors.blueAccent,
    Constant.success: Color(0xFF388E3C),
    Constant.refuse: Colors.red,
    Constant.review: Color(0xFF388E3C),
  };
  static const Map<int, double> stepColor = {
    Constant.notYet: 0.6,
    Constant.wait: 0.8,
    Constant.success: 0.8,
    Constant.refuse: 0.8,
    Constant.review: 0.8,
  };

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0), bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: FitnessAppTheme.grey.withOpacity(0.4), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: SizedBox(
                          height: 74,
                          child: AspectRatio(
                            aspectRatio: 1.714,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(statusColor[status]!.withOpacity(0.85), BlendMode.modulate),
                              child: Image.asset("assets/images/back.png"),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 96,
                                  right: 16,
                                  top: 14,
                                ),
                                child: Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    letterSpacing: 0.0,
                                    color: FitnessAppTheme.nearlyBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 96,
                              bottom: 12,
                              top: 4,
                              right: 16,
                            ),
                            child: Text(
                              subtitle,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                letterSpacing: 0.0,
                                color: FitnessAppTheme.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 4,
                child: Container(
                  width: 80,
                  height: 80,
                  child: Text(
                    "step",
                    style: GoogleFonts.kanit(
                      color: FitnessAppTheme.nearlyDarkBlue.withOpacity(stepColor[status]!),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 2,
                child: Container(
                  width: 80,
                  height: 80,
                  child: Text(
                    step,
                    style: GoogleFonts.kanit(
                      color: FitnessAppTheme.nearlyDarkBlue.withOpacity(stepColor[status]! + 0.2),
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
              /*Positioned(
                top:24,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent[700],
                    borderRadius: BorderRadius.circular(38.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
                  child: const Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),*/
              Positioned(
                top: 26,
                right: 12,
                child: statusIcon[status]!,
              ),
            ],
          ),
        ),
      ],
    );
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
