import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:flutter_learn_getx/pages/edit_page.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/services/task_service.dart';

class EditPageController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();
  var task = Task(id: '', name: '', status: TaskStatus.todo).obs;
  final editType = EditPageType.add.obs;
  late TextEditingController nameController;

  EditPageController({required TaskId? id}) {
    task.value = taskService.getTaskBy(id: id);
    if (id != null) {
      editType.value = EditPageType.edit;
    } else {
      editType.value = EditPageType.add;
    }
  }

  @override
  void onInit() {
    super.onInit();
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

  void onCancel() {
    Get.back();
  }
}
