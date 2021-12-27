import 'package:flutter/material.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/theme/theme.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Do not have an account yet?',
            style: theme.textTheme.subtitle2,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr),
        SizedBox(height: 10),
        InkWell(
          onTap: (){
             Navigator.pushNamed(context, RegistrationRoute);
          },
          child: Text('Sign Up',
              style: theme.textTheme.headline4,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr),
        ),
      ],
    );
  }
}
