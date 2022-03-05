import 'package:flutter/material.dart';

class RoundCornerShape extends StatelessWidget {
  Widget child;
  Color bgColor;
  Color strokeColor;
  double radius;

  RoundCornerShape(
      {required this.child,
      required this.bgColor,
      required this.radius,
      this.strokeColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: strokeColor),
          borderRadius: BorderRadius.circular(
            radius,
          )),
      color: bgColor,
      child: child,
    ));
  }
}
