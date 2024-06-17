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
}