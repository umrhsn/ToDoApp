import 'package:equatable/equatable.dart';

/// "extends [Equatable]" to make it easier to compare objects.
/// it is a base class that facilitates operator == and hashCode overrides.

class Task extends Equatable {
  final int id;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String reminder;
  final String repeatInterval;
  final String category;
  bool isCompleted;
  bool isFavorite;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.reminder,
    required this.repeatInterval,
    required this.category,
    required this.isCompleted,
    required this.isFavorite,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
