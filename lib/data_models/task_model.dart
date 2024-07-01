import 'package:flutter_learn_getx/data_models/task_status.dart';

typedef TaskId = String;

class Task {
  TaskId id;
  String name;
  TaskStatus status;

  Task({required this.id, required this.name, required this.status});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      name: json['name'] as String,
      status: TaskStatus.values.firstWhere((e) => e.index == json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status.index,
    };
  }
}