import 'package:flutter_learn_getx/dataModel/TaskStatus.dart';
import 'package:flutter_learn_getx/dataModel/task_model.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();

  void createTask(String taskName, TaskStatus status) {
    taskService.createTask(taskName, status);
  }

  void removeTask(int index) {
    taskService.removeTask(index);
  }

  void updateTask(int index, TaskModel task) {
    taskService.updateTask(index, task);
  }
}
