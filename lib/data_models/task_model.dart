import 'package:flutter_learn_getx/data_models/task_status.dart';

class TaskModel {
  int id;
  String taskName;
  TaskStatus status;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      taskName: json['taskName'],
      status: TaskStatus.values[json['status']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'status': status.index,
    };
  }
}