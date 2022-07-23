part of 'board_cubit.dart';

abstract class BoardState extends Equatable {
  const BoardState();
}

class BoardInitial extends BoardState {
  @override
  List<Object> get props => [];
}
