import 'package:flutter/material.dart';
import 'package:ppm/components/checkbox_model.dart';
import 'package:ppm/theme/theme.dart';

class Checkbox extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  const Checkbox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxModel(
      fillColor: theme.checkboxTheme.fillColor!,
      value: value,
      onChanged: onChanged,
      border: theme.checkboxTheme.side!,
    );
  }
}
