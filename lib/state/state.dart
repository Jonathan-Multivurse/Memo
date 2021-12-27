import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ppm/state/password/password_cubit.dart';
import 'package:ppm/state/terms/terms_cubit.dart';

stateProvider(MaterialApp child) {
  return MultiBlocProvider(
    child: child,
    providers: [
      BlocProvider<PasswordCubit>(
        create: (BuildContext context) => PasswordCubit(),
      ),
      BlocProvider<TermsCubit>(
        create: (BuildContext context) => TermsCubit(),
      ),
    ],
  );
}
