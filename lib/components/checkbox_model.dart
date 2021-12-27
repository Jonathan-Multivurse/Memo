import 'package:flutter/material.dart';

class CheckboxModel extends StatefulWidget {
  final MaterialStateProperty<Color?> fillColor;
  final bool value;
  final BorderSide border;
  final void Function(bool?) onChanged;

  CheckboxModel({
    Key? key,
    required this.fillColor,
    required this.value,
    required this.onChanged,
    required this.border,
  }) : super(key: key);

  @override
  State<CheckboxModel> createState() => _CheckboxModelState();
}

class _CheckboxModelState extends State<CheckboxModel> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        hoverColor: Colors.transparent,
        splashRadius: 0,
        checkColor: Colors.white,
        fillColor: widget.fillColor,
        value: widget.value,
        onChanged: widget.onChanged,
        side: widget.border);
  }
}
