import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ppm/components/alert_model.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/state/password/password_cubit.dart';
import 'package:ppm/theme/theme.dart';
import 'package:ppm/widgets/authentication/forgot_password.dart';
import 'package:ppm/widgets/authentication/no_account.dart';
import 'package:ppm/widgets/authentication/rememberme.dart';
import 'package:ppm/widgets/common/button.dart';
import 'package:ppm/widgets/common/input.dart';
import 'package:ppm/widgets/common/logo.dart';
import 'package:ppm/widgets/common/title.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AuthForm extends StatefulWidget {
  AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter a valid email address')
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  bool _isChecked = false;

  @override
  // ignore: must_call_super
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('emailData')!;
      _passwordController.text = prefs.getString('passData')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    void userAuthentication() {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((result) {
        Navigator.pushNamed(context, HomeRoute);
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: AlertModel(
                  padding: EdgeInsets.all(20),
                  data: 'Incorrect Credentials or No Account Found!',
                  height: 200,
                  width: 300,
                ),
              );
            });
      });
    }

    var device = MediaQuery.of(context).size;
    var height = device.height;

    return Material(
      child: Container(
        height: height,
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),
              CommonTitle(title: 'Sign In to Continue'),
              Input(
                obscure: false,
                label: 'Email',
                suffixIcon:
                    Visibility(visible: false, child: Icon(Icons.email)),
                validator: emailValidator,
                controller: _emailController,
              ),
              SizedBox(height: 20),
              BlocBuilder<PasswordCubit, bool>(
                builder: (context, passwordState) {
                  return Input(
                    obscure: passwordState,
                    label: 'Password',
                    suffixIcon: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onTap: () {
                        passwordState == true
                            ? context.read<PasswordCubit>().passwordShow()
                            : context.read<PasswordCubit>().passwordHide();
                      },
                      child: Icon(Icons.remove_red_eye,
                          size: 20, color: Colors.green[500]),
                    ),
                    validator: passwordValidator,
                    controller: _passwordController,
                  );
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RememberMe(
                      value: _isChecked,
                      onChanged: (bool) {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                    ),
                    ForgotPassword(
                      onTap: () {
                        print('works');
                      },
                    )
                  ],
                ),
              ),
              Button(
                text: 'Sign In',
                style: theme.textButtonTheme.style!,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('validated');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (_isChecked == true) {
                      prefs.setString('emailData', _emailController.text);
                      prefs.setString('passData', _passwordController.text);
                    }

                    userAuthentication();
                  } else {
                    print('Error, Something went wrong!');
                  }
                },
              ),
              SizedBox(height: 10),
              NoAccount()
            ],
          ),
        ),
      ),
    );
  }
}
