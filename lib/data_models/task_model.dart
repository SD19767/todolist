import 'package:flutter_learn_getx/data_models/task_status.dart';

typedef TaskId = int;
typedef Index = int;

class Task {
  TaskId id;
  String name;
  TaskStatus status;

  Task({
    required this.id,
    required this.name,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['taskName'],
      status: TaskStatus.values[json['status']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': name,
      'status': status.index,
    };
  }
}
