import 'package:flutter/material.dart';

class TileModel extends StatelessWidget {
  final Widget? title;
  final GestureTapCallback? onTap;

  const TileModel({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: title,
        dense: true,
        enabled: true,
        onTap: onTap,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.all(0),
        focusColor: Colors.transparent,
        tileColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }
}
