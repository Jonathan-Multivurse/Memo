import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class Return extends StatelessWidget {
  final Function() onTap;
  const Return({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Text('Return to Sign In',
          style: theme.textTheme.subtitle2,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr),
    );
  }
}
