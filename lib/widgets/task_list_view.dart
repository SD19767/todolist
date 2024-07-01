import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/controllers/list_view_controller.dart';
import 'package:flutter_learn_getx/widgets/task_list_item.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:get/get.dart';

class TaskListView extends StatelessWidget {
  final List<Task> tasks;
  final ListViewController listViewController = Get.put(ListViewController());

  TaskListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskListItem(
              task: tasks[index],
              editButtonOnPressed: () {
                listViewController.editButtonOnPressed(task: tasks[index]);
              },
              removeButtonOnPressed: () {
                listViewController.removeButtonOnPressed(context,
                    task: tasks[index]);
              },
            );
          }),
    );
  }
}
