import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class ForgotPassword extends StatelessWidget {
  final Function() onTap;
  const ForgotPassword({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text('Forgot Password',
          style: theme.textTheme.subtitle2!,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr),
    );
  }
}
