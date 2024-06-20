import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:flutter_learn_getx/pages/edit_page.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/services/task_service.dart';

class EditPageController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();
  var task = Task(id: 0, name: '', status: TaskStatus.todo).obs;
  final editType = EditPageType.add.obs;
  late TextEditingController nameController;

  @override
  void onInit() {
    super.onInit();
    if (editType.value == EditPageType.add) {
      addTask();
    }
    nameController = TextEditingController(text: task.value.name);
    nameController.addListener(() {
      task.update((task) {
        task?.name = nameController.text;
      });
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void onSave() {
    // 保存邏輯
    print('Task ID: ${task.value.id}');
    print('Task Name: ${task.value.name}');
    print('Status: ${task.value.status}');
    if (editType.value == EditPageType.add) {
      taskService.addTask(task.value);
    } else {
      taskService.updateTask(task.value);
    }
    Get.back();
  }

   void addTask() {
    task.value = taskService.getNewBlankTask();
  }

  void onCancel() {
    Get.back();
  }
}