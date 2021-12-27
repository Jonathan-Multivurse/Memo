import 'package:flutter/material.dart';
import 'package:ppm/theme/theme.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Image(
            height: 75,
            image: AssetImage('lib/assets/logo/logo.png'),
          ),
          SizedBox(height: 25),
          Text(
            'Personal Property Memo'.toUpperCase(),
            style: theme.textTheme.headline3,
          )
        ],
      ),
    );
  }
}
