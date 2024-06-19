import 'package:get/get.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:flutter_learn_getx/pages/edit_page.dart';

class HomePageController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();
  var addTaskButtonPressed = false.obs;

  HomePageController() {
    addTaskButtonPressed.listen((pressed) {
      if (pressed) {
        navigateToEditPage();
        addTaskButtonPressed.value = false;
      }
    });
  }

  void onSave(int id, String taskName, TaskStatus status) {
    // 保存邏輯
    print('Task ID: $id');
    print('Task Name: $taskName');
    print('Status: $status');
    // 可以根據需要調用 taskService 來保存任務
  }

  void onCancel() {
    // 取消邏輯
    Get.back();
  }

  void navigateToEditPage() {
    Get.toNamed('/edit', arguments: {
      'initialStatus': TaskStatus.todo,
      'id': 0,
      'initialTaskName': '',
      'onSave': (int id, String taskName, TaskStatus status) {
        onSave(id, taskName, status);
      },
      'onCancel': onCancel,
    });
  }

  void triggerAddTask() {
    addTaskButtonPressed.value = true;
  }
}
