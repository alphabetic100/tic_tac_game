import 'package:flutter_bloc/flutter_bloc.dart';

class SelectStatusCubit extends Cubit<int> {
  SelectStatusCubit() : super(0);
  void checkTic(int index) {
    emit(index);
  }
}
