import 'package:flutter/material.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/theme/theme.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Already have an account?',
            style: theme.textTheme.subtitle2,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AuthenticationRoute);
          },
          child: Text('Sign In',
              style: theme.textTheme.headline4,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr),
        ),
      ],
    );
  }
}
