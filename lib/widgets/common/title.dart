import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  const CommonTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 15, left: 15),
      child: Text(
        title.toUpperCase(),
        style: theme.textTheme.subtitle1,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
