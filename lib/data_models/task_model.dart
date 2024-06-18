import 'package:flutter_learn_getx/data_models/task_status.dart';

class TaskModel {
  int id;
  String taskName;
  TaskStatus status;

  TaskModel({required this.id, required this.taskName, required this.status});
}