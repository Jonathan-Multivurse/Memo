import 'package:bloc/bloc.dart';

class EditCubit extends Cubit<bool> {
  EditCubit() : super(false);
  void showForm() => emit(true);
  void hideForm() => emit(false);
}
