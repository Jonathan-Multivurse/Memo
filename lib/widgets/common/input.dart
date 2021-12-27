import 'package:flutter/material.dart';
import 'package:ppm/components/input_model.dart';

class Input extends StatelessWidget {
  final bool obscure;
  final String label;
  final Widget suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const Input({
    Key? key,
    required this.obscure,
    required this.label,
    required this.suffixIcon,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputModel(
        width: 300,
        obscure: obscure,
        label: label,
        suffixIcon: suffixIcon,
        validator: validator,
        controller: controller,
      ),
    );
  }
}
