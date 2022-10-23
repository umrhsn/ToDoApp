import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as join;
import 'package:sqflite/sqflite.dart';

part 'db_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitialized());

  static DatabaseCubit get(context) => BlocProvider.of<DatabaseCubit>(context);

  late Database database;

  List<Map> tasks = [];
  Map selectedTask = {};
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController remindController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

  void initAppDatabase() async {
    var dbPath = await getDatabasesPath();
    String path = join.join(dbPath, 'todo.db');
    debugPrint('DatabaseInitialized');
    openAppDatabase(path: path);
    emit(DatabaseInitialized());
  }

  void openAppDatabase({required String path}) {
    openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE tasks ("
            "id INTEGER PRIMARY KEY, "
            "title TEXT, "
            "date TEXT, "
            "startTime TEXT, "
            "endTime TEXT, "
            "reminder TEXT, "
            "repeatInterval TEXT, "
            "category TEXT, "
            "isCompleted BLOB, "
            "isFavorite BLOB, "
            "color INTEGER"
            ")");
        debugPrint('Table created');
      },
      onOpen: (Database db) {
        debugPrint('DatabaseOpened');
        database = db;
        getAllTasks();
      },
    );
  }

  void getAllTasks() async {
    emit(DatabaseLoading());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      debugPrint('Tasks Data Fetched');
      tasks = value;
      debugPrint(tasks.toString());
      emit(DatabaseTasksFetched());
    });
  }

  void getCompletedTasks() async {
    emit(DatabaseLoading());
    database.rawQuery('SELECT * FROM tasks WHERE isCompleted = TRUE').then((value) {
      debugPrint('Completed Tasks Data Fetched');
      tasks = value;
      debugPrint(tasks.toString());
      emit(DatabaseTasksFetched());
    });
  }

  void getUnCompletedTasks() async {
    emit(DatabaseLoading());
    database.rawQuery('SELECT * FROM tasks WHERE isCompleted = FALSE').then((value) {
      debugPrint('Uncompleted Tasks Data Fetched');
      tasks = value;
      debugPrint(tasks.toString());
      emit(DatabaseTasksFetched());
    });
  }

  void getFavoriteTasks() async {
    emit(DatabaseLoading());
    database.rawQuery('SELECT * FROM tasks WHERE isFavorite = TRUE').then((value) {
      debugPrint('Uncompleted Tasks Data Fetched');
      tasks = value;
      debugPrint(tasks.toString());
      emit(DatabaseTasksFetched());
    });
  }

  // 'INSERT INTO tasks(title, date, endTime, isCompleted, isFavorite) '
  // 'VALUES('
  // '"${titleController.text}", '
  // '"${dateController.text}", '
  // '"${endTimeController.text}", '
  // 'FALSE, '
  // 'FALSE'
  // ')'

  void createTask() {
    database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, endTime, isCompleted, isFavorite) VALUES(?, ?, ?, ?, ?)',
          [(titleController.text), (dateController.text), (endTimeController.text), false, false]);
    }).then((value) {
      debugPrint('Task Data Inserted');
      titleController.clear();
      getAllTasks();
      debugPrint('${tasks.length}');
      emit(DatabaseTaskCreated());
    });
  }

  void updateTaskCompletionState({required int id, required int isCompleted}) {
    emit(DatabaseLoading());
    database
        .rawUpdate('UPDATE tasks SET isCompleted = ? WHERE id = $id', [isCompleted]).then((value) {
      debugPrint('User Data Updated');
      getAllTasks();
    });
  }

  void markTaskAsFavorite() {}
}
