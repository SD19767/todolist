import 'package:flutter/material.dart';

enum TaskStatus {
  todo,
  inProgress,
  complete
}

extension TaskStatusExtension on TaskStatus {
  String get description {
    switch (this) {
      case TaskStatus.todo:
        return 'Todo';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.complete:
        return 'Complete';
      default:
        return '';
    }
  }

    Color get statusColor {
    switch (this) {
      case TaskStatus.todo:
        return Colors.grey;
      case TaskStatus.inProgress:
        return Colors.orange;
      case TaskStatus.complete:
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}