import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class MemoEmpty extends StatelessWidget {
  const MemoEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Center(
          child: Image.asset(
            'lib/assets/images/empty.png',
            height: 200,
            width: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text('You have 0 Memos. You can create one on the memo tab',
          textAlign: TextAlign.center,
              style: theme.textTheme.headline2),
        )
      ],
    ));
  }
}
