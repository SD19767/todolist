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
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void onSave() {
    task.value.name = nameController.text;
    taskService.save(task.value);
    Get.back();
  }

  void addTask() {
    task.value = taskService.getNewBlankTask();
  }

  void onCancel() {
    Get.back();
  }
}
