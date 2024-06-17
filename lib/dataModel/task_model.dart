import 'package:flutter_learn_getx/dataModel/TaskStatus.dart';

class TaskModel {
  int id;
  String taskName;
  TaskStatus status;

  TaskModel({required this.id, required this.taskName, required this.status});
}