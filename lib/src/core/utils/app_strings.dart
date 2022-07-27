class AppStrings {
  static const String appName = 'ToDoApp';

  /// screen AppBar titles
  static const String boardScreenTitle = 'Board';
  static const String addTaskScreenTitle = 'Add task';
  static const String scheduleScreenTitle = 'Schedule';

  /// app font
  static const String fontFamily = 'Product Sans';

  /// app route
  static const String noRouteFound = 'No Route Found';

  /// buttons labels
  static const String addTaskButtonLabel = 'Add a task';
  static const String createTaskButtonLabel = 'Create a task';

  /// TextFormField labels
  static String titleTextFieldLabel = 'Title';
  static String dateTextFieldLabel = 'Date';
  static String startTimeTextFieldLabel = 'Start time';
  static String endTimeTextFieldLabel = 'End time';
  static String remindTextFieldLabel = 'Reminder';
  static String repeatTextFieldLabel = 'Repeat';

  /// date
  static String dateNow = DateTime.now().toString().substring(0, 10);

  /// lists
  static List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  static List<String> reminderList = [
    '10 min before',
    '30 min before',
    '1 hour before',
    '1 day before',
  ];
}
