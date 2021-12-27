import 'package:flutter/material.dart';

class SecondaryButtonModel extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final String name;
  final TextStyle textStyle;
  final ButtonStyle style;
  final void Function()? onPressed;

  const SecondaryButtonModel(
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
      child: TextButton(
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
