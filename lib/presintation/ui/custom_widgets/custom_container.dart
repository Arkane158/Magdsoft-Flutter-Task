import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.child,
    this.margin = 0,
    this.radiusBottomLeft = 0,
    this.radiusBottomRight = 0,
    this.radiusTopLeft = 0,
    this.radiusTopRight = 0,
    required this.height,
    required this.width,
    this.containerColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final double radiusBottomLeft;
  final double radiusBottomRight;
  final double radiusTopLeft;
  final double radiusTopRight;
  final double height;
  final double width;
  final Color? containerColor;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.all(margin),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusTopLeft),
          topRight: Radius.circular(radiusTopRight),
          bottomLeft: Radius.circular(radiusBottomLeft),
          bottomRight: Radius.circular(radiusBottomRight),
        ),
        color: containerColor,
      ),
      child: child,
    );
  }
}
