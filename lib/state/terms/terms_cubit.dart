import 'package:bloc/bloc.dart';

class TermsCubit extends Cubit<bool> {
  TermsCubit() : super(false);
  void termsCheck() => emit(true);
  void termsUncheck() => emit(false);
}
