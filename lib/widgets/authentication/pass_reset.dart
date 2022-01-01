import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ppm/components/alert_model.dart';
import 'package:ppm/components/confirmation_model.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/theme/theme.dart';
import 'package:ppm/widgets/authentication/return.dart';
import 'package:ppm/widgets/common/button.dart';
import 'package:ppm/widgets/common/input.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailValidator = MultiValidator([
      RequiredValidator(errorText: 'Email is required'),
      EmailValidator(errorText: 'Enter a valid email address')
    ]);
    var _emailController = TextEditingController();

    void passwordReset() {
      FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: _emailController.text,
      )
          .then((result) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Center(
                  child: ConfirmationModel(
                      title: 'Password Reset',
                      data: 'Reset link sent to your email',
                      height: 200,
                      width: 300,
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        Navigator.pushNamed(context, AuthenticationRoute);
                      },
                      button: 'Got it'));
            });
      }).catchError((err) {
        print(err.message);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: AlertModel(
                  padding: EdgeInsets.all(20),
                  data: err.message,
                  height: 200,
                  width: 300,
                ),
              );
            });
      });
    }

    return Material(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset Password'.toUpperCase(),
                style: theme.textTheme.headline3,
              ),
              SizedBox(height: 20),
              Input(
                  obscure: false,
                  label: 'Email',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.email)),
                  validator: emailValidator,
                  controller: _emailController),
              SizedBox(height: 20),
              Button(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Reset');
                    passwordReset();
                  }
                },
                style: theme.textButtonTheme.style!,
                text: 'Reset',
              ),
              SizedBox(height: 20),
              Return(onTap: () {
                Navigator.pushNamed(context, AuthenticationRoute);
              })
            ],
          )),
    );
  }
}
