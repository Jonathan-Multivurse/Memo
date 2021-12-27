import 'package:flutter/material.dart';

class ChipModel extends StatelessWidget {
  final Widget label;
  final Color color;
  final TextStyle style;
  const ChipModel({
    Key? key,
    required this.label,
    required this.color,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Chip(
        label: label,
        labelStyle: style,
        backgroundColor: color,
      ),
    );
  }
}
