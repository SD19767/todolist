import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/widgets/task_list_item.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';

class TaskListView extends StatelessWidget {
  final List<Task> tasks;

  TaskListView({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskListItem(task: tasks[index]);
      },
    );
  }
}