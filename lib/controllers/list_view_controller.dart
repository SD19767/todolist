import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';

class ListViewController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();

  void editButtonOnPressed({required Task task}) {
    final id = task.id;
    Get.toNamed('/edit', parameters: {'id': id});
  }

  void removeButtonOnPressed(BuildContext context, {required Task task}) {
    Get.dialog(
      AlertDialog(
        title: Text('confirm_delete'.tr),
        content: Text('delete_task_prompt'.trParams({'id': task.id, 'name': task.name})),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back(); // Dismiss the dialog
            },
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () {
              taskService.removeTaskBy(task: task);
              Get.back(); // Dismiss the dialog
            },
            child: Text('delete'.tr),
          ),
        ],
      )
    );
  }
}