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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final id = task.id;
        final name = task.name;
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text(
              'Are you sure you want to delete this task? id:$id Name:$name'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                taskService.removeTaskBy(task: task);
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
