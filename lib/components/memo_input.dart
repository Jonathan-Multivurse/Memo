import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class MemoInputModel extends StatelessWidget {
  final bool obscure;
  final String label;
  final Widget suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  MemoInputModel({
    Key? key,
    required this.obscure,
    required this.label,
    required this.suffixIcon,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: Material(
          color: Colors.transparent,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            obscureText: obscure,
            style: theme.inputDecorationTheme.labelStyle!,
            cursorColor: theme.textSelectionTheme.cursorColor!,
            decoration: InputDecoration(
              isDense: false,
              hoverColor: Colors.transparent,
              fillColor: Colors.white,
              errorStyle: TextStyle(
                backgroundColor: Colors.grey[50],
                color: Colors.red[500]!,
                fontSize: 13,
                fontFamily: 'Light',
              ),
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
