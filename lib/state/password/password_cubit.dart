import 'package:bloc/bloc.dart';

class PasswordCubit extends Cubit<bool> {
  PasswordCubit() : super(true);
  void passwordShow() => emit(false);
  void passwordHide() => emit(true);
}
