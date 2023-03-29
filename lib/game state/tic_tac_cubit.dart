import 'package:flutter_bloc/flutter_bloc.dart';

class TicTacCubit extends Cubit<TicTacInitial> {
  TicTacCubit() : super(TicTacInitial(initialList: ticTacInitial));

  void getIndex(int index, String value) {
    ticTacInitial[index] = value;
    emit(TicTacInitial(initialList: ticTacInitial));
  }

  void clearBoard(int value) {
    for (int i = 0; i < 9; i++) {
      ticTacInitial[i] = "";
      emit(TicTacInitial(initialList: ticTacInitial));
    }
  }
}

class TicTacInitial {
  final List<String> initialList;
  TicTacInitial({required this.initialList});
}

List<String> ticTacInitial = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
];
