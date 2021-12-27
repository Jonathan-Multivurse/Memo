import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class InputModel extends StatelessWidget {
  final double width;
  final bool obscure;
  final String label;
  final Widget suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  InputModel({
    Key? key,
    required this.width,
    required this.obscure,
    required this.label,
    required this.suffixIcon,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Material(
          color: Colors.transparent,
          child: TextFormField(
            obscureText: obscure,
            style: theme.inputDecorationTheme.labelStyle!,
            cursorColor: theme.textSelectionTheme.cursorColor!,
            decoration: InputDecoration(
              isDense: false,
              hoverColor: Colors.transparent,
              suffixIcon: suffixIcon,
              suffixStyle: TextStyle(color: Colors.amber),
              fillColor: theme.inputDecorationTheme.fillColor!,
              errorStyle: theme.inputDecorationTheme.errorStyle!,
              border: theme.inputDecorationTheme.border!,
              errorBorder: theme.inputDecorationTheme.errorBorder!,
              focusedBorder: theme.inputDecorationTheme.focusedBorder!,
              enabledBorder: theme.inputDecorationTheme.enabledBorder!,
              contentPadding: theme.inputDecorationTheme.contentPadding!,
              label: Text(label, style: theme.textTheme.subtitle2),
              labelStyle: theme.inputDecorationTheme.labelStyle!,
            ),
            validator: validator,
            controller: controller,
          ),
        ));
  }
}
