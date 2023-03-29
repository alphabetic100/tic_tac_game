import 'package:flutter_bloc/flutter_bloc.dart';

class DrawState extends Cubit<int> {
  DrawState() : super(0);
  void increment() {
    emit(state + 1);
  }

  void clear() {
    int clereState = state;
    clereState = 0;
    emit(clereState);
  }
}
