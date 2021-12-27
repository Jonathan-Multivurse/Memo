import 'package:flutter/material.dart';

class CircularFrameModel extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  final Decoration decoration;

  const CircularFrameModel({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    required this.padding,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: decoration,
      child: child,
    );
  }
}
