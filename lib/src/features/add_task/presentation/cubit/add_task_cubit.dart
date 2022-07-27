import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<int> {
  AddTaskCubit() : super(0);
}
