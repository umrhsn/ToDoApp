import 'package:equatable/equatable.dart';

/// "extends [Equatable]" to make it easier to compare objects.
/// it is a base class that facilitates operator == and hashCode overrides.

class Task extends Equatable {
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final List<String> reminders;
  final List<String> repeatIntervals;
  String state; // finished or not

  Task({
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.reminders,
    required this.repeatIntervals,
    required this.state,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        date,
        startTime,
        endTime,
        reminders,
        repeatIntervals,
        state,
      ];
}
