import 'package:flutter/material.dart';

class CardModel extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Decoration decoration;

  const CardModel({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: Card(
        child: child,
      ),
    );
  }
}
