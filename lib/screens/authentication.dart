import 'package:flutter/material.dart';
import 'package:ppm/widgets/authentication/form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: AuthForm());
  }
}
