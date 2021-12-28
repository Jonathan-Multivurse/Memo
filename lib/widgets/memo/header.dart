import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class MemoHeader extends StatelessWidget {
  const MemoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    var height = device.width;
    return Material(
      elevation: 1,
      child: Container(
        height: height * 0.25,
        padding: EdgeInsets.only(top: 25),
        child: Center(
          child: Text(
            'Create Memos'.toUpperCase(),
            style: theme.textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
