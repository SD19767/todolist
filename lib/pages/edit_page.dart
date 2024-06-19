import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';
import 'package:flutter_learn_getx/pages/custom_outlined_button.dart';
import 'package:get/get.dart';

class EditPage extends StatelessWidget {
  TaskStatus currentStatus = TaskStatus.todo;
  int id = 0;
  String taskName = '';
  VoidCallback? onSave;
  VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = const InputDecoration(
      labelText: 'Task name',
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0), // 確保 TextField 和 DropdownButton 高度一致
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.getEdgeInsets()),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('#'),
                  Text('$id'),
                  const Spacer(),
                ],
              ),
              SizedBox(height: SizeConfig.getVerticalSpacer()),
              SizedBox(
                height: SizeConfig.getVerticalSpacer(),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration:
                            inputDecoration.copyWith(labelText: 'Task name'),
                        onChanged: (text) {
                          taskName = text;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.getVerticalSpacer()),
              SizedBox(
                height: SizeConfig.getVerticalSpacer(),
                child: Row(
                  children: [
                    Expanded(
                      child: InputDecorator(
                        decoration:
                            inputDecoration.copyWith(labelText: 'Status'),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<TaskStatus>(
                            isExpanded: true,
                            value: currentStatus,
                            onChanged: (TaskStatus? newValue) {
                              if (newValue != null) {
                                currentStatus = newValue;
                              }
                            },
                            items: TaskStatus.values.map((TaskStatus status) {
                              return DropdownMenuItem<TaskStatus>(
                                value: status,
                                child: Text(status.description),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.getVerticalSpacer()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomOutlinedButton(
                    onPressed: () {
                      if (onCancel != null) {
                        onCancel!();
                      } 
                    },
                    text: 'cancel',
                  ),
                  const Spacer(), // Add some space between buttons
                  CustomOutlinedButton(
                    onPressed: () {
                      if (onSave != null) {
                        onSave!();
                      }
                    },
                    text: 'save',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
