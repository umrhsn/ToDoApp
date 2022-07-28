import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<int> {
  BoardCubit() : super(0);

  static BoardCubit get(context) => BlocProvider.of<BoardCubit>(context);

  bool isChecked = false;

  void changeCheckState() {
    debugPrint('$isChecked');
    isChecked = !isChecked;
    debugPrint('$isChecked');
    emit(state + 1);
  }
}
