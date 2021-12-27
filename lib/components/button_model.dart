import 'package:flutter/material.dart';

class ButtonModel extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final String name;
  final TextStyle textStyle;
  final ButtonStyle style;
  final void Function()? onPressed;

  const ButtonModel(
      {Key? key,
      required this.height,
      required this.width,
      required this.padding,
      required this.onPressed,
      required this.name,
      required this.textStyle,
      required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      child: ElevatedButton(
        child: Text(
          name,
          style: textStyle,
        ),
        onPressed: onPressed,
        style: style,
      ),
    );
  }
}
