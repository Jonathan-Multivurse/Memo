import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ppm/components/alert_model.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/state/password/password_cubit.dart';
import 'package:ppm/state/terms/terms_cubit.dart';
import 'package:ppm/theme/theme.dart';
import 'package:ppm/widgets/common/button.dart';
import 'package:ppm/widgets/common/input.dart';
import 'package:ppm/widgets/common/title.dart';
import 'package:ppm/widgets/registration/have_account.dart';
import 'package:ppm/widgets/registration/terms.dart';
import 'package:ppm/widgets/registration/terms_error.dart';

// ignore: must_be_immutable
class RegForm extends StatefulWidget {
  RegForm({Key? key}) : super(key: key);

  @override
  _RegFormState createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  final firstNameValidator = MultiValidator([
    RequiredValidator(errorText: 'First Name is required'),
    MinLengthValidator(3, errorText: 'Name must be at least 3 digits long'),
  ]);

  final lastNameValidator = MultiValidator([
    RequiredValidator(errorText: 'Last Name is required'),
    MinLengthValidator(3,
        errorText: 'Job title must be at least 3 digits long'),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter a valid email address')
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText:
            'passwords must have at least one special character #?!@%^&*-'),
  ]);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var _firstNameController = TextEditingController();
    var _lastNameController = TextEditingController();
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();

    void userRegistration() {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((result) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(result.user!.uid)
            .set({
          "uid": result.user!.uid,
          "firstName": _firstNameController.text,
          "lastName": _lastNameController.text,
          "email": _emailController.text,
          "password": _passwordController.text,
        }).then((res) {
          Navigator.pushNamed(context, HomeRoute);
        });
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: AlertModel(
                  padding: EdgeInsets.all(20),
                  data: err.message,
                  height: 200,
                  width: 400,
                ),
              );
            });
      });
    }

    return Material(
      child: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Personal Property Memo'.toUpperCase(),
                style: theme.textTheme.headline3,
              ),
              SizedBox(height: 10),
              CommonTitle(title: 'Create Your Account'),
              Input(
                  obscure: false,
                  label: 'First Name',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.person)),
                  validator: firstNameValidator,
                  controller: _firstNameController),
              SizedBox(height: 20),
              Input(
                  obscure: false,
                  label: 'Last Name',
                  suffixIcon:
                      Visibility(visible: false, child: Icon(Icons.work)),
                  validator: lastNameValidator,
                  controller: _lastNameController),
              SizedBox(height: 20),
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
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Terms(),
              ),
              BlocBuilder<TermsCubit, bool>(
                builder: (context, termsState) {
                  return Button(
                    text: 'Sign Up',
                    style: theme.textButtonTheme.style!,
                    onPressed: () {
                      if (_formKey.currentState!.validate() == false) {
                        print('Form not validated!');
                      } else if (termsState == false) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                Center(child: TermsError()));
                      } else if (_formKey.currentState!.validate() &&
                          termsState == true) {
                        userRegistration();
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 10),
              HaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}
