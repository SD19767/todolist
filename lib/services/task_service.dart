import 'package:flutter_learn_getx/dataModel/TaskStatus.dart';
import 'package:flutter_learn_getx/dataModel/task_model.dart';
import 'package:get/get.dart';

class TaskService extends GetxController {
  final tasks = <TaskModel>[];

  void createTask(String taskName,TaskStatus status) {
    tasks.add(TaskModel(id: _getNewID(), taskName: taskName, status: status));
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void updateTask(int index, TaskModel task){
    tasks.insert(index, task);
  }

  int _getNewID() {
    if (tasks.isNotEmpty) {
      final newID = tasks.last.id++;
      return newID;
    } else {
      return 0;
    }
  }
}