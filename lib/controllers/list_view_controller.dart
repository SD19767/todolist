import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';

class ListViewController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();

  void editButtonOnPressed({required Task task}) {
    final id = task.id;
    Get.toNamed('/edit', parameters: {'id': '$id'});
  }

  void removeButtonOnPressed({required Task task}) {
    taskService.removeTaskBy(task: task);
  }
}
