import 'package:flutter_bloc/flutter_bloc.dart';

class GameStateCubit extends Cubit<int> {
  GameStateCubit() : super(-1);
  void checkIndex(int index) {
    emit(index);
  }


}

class InitState {
  final List indexList;
  final int? checkIndex;
  InitState({required this.indexList, this.checkIndex});
}


