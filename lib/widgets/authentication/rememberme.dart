import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class RememberMe extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  const RememberMe({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text('Remeber Me',
            style: theme.textTheme.subtitle2!,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr)
      ],
    );
  }
}
