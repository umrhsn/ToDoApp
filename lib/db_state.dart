part of 'db_cubit.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseInitialized extends DatabaseState {}

class DatabaseOpened extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}

class DatabaseTasksFetched extends DatabaseState {}

class DatabaseTaskCreated extends DatabaseState {}

class DatabaseTaskUpdated extends DatabaseState {}
