import 'package:flutter/material.dart';
import 'package:ppm/components/button_model.dart';
import 'package:ppm/theme/theme.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final ButtonStyle style;
  const Button(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonModel(
      height: 50,
      width: 300,
      padding: EdgeInsets.all(0),
      name: text,
      textStyle: theme.textTheme.button!,
      style: style,
      onPressed: onPressed,
    );
  }
}
