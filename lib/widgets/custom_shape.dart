import 'package:ai_score/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomShape extends StatelessWidget {
  Widget? child;
  Color? bgColor;
  Color? strokeColor;
  double? width;
  double? height;
  BorderRadiusGeometry? radius;

  CustomShape(
      {@required this.child,
      @required this.bgColor,
      @required this.radius,
      this.width,
      this.height,
      this.strokeColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: strokeColor!), borderRadius: radius!),
          color: bgColor,
          child: child,
        ));
  }
}
