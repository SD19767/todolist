import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn_getx/widgets/custom_outlined_button.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(task.id.toString()),
        title: Text(task.name),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatusChip(task.status),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Edit action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Remove action
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(TaskStatus status) {
    return CustomOutlinedButton(
      onPressed: () {},
      text: status.description,
      textColor: status.statusColor,
      borderColor: status.statusColor,
    );
  }
}
