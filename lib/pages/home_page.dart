import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/widgets/task_list_view.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';
import 'package:flutter_learn_getx/widgets/custom_outlined_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageController = Get.find<HomePageController>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.getEdgeInsets()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TODO List Demo App2222',
              style: TextStyle(
                  fontSize: SizeConfig.getBigTitleSize(),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Container(
              color: Color(0xFFFDF6E3),
              child: Text(
                'Do it now.',
                style: TextStyle(fontSize: SizeConfig.getTitleSize()),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomOutlinedButton(
                  onPressed: homePageController.triggerAddTask,
                  text: 'Add Task',
                )
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TaskListView(tasks: homePageController.taskService.tasks),
            )
          ],
        ),
      ),
    );
  }
}
