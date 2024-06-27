import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/services/translation_service.dart';
import 'package:flutter_learn_getx/translations/langauges.dart';
import 'package:flutter_learn_getx/widgets/task_list_view.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';
import 'package:flutter_learn_getx/widgets/custom_outlined_button.dart';

class HomePage extends StatelessWidget {

  final _controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("translation".tr),
          centerTitle: false,
          actions: [languageChooser()],
        ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.getEdgeInsets()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'todo_list_demo_app'.tr,
              style: TextStyle(
                  fontSize: SizeConfig.getBigTitleSize(),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Container(
              color: Color(0xFFFDF6E3),
              child: Text(
                'do_it_now'.tr,
                style: TextStyle(fontSize: SizeConfig.getTitleSize()),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomOutlinedButton(
                  onPressed: _controller.triggerAddTask,
                  text: 'add_task'.tr,
                )
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TaskListView(tasks: _controller.taskService.tasks),
            )
          ],
        ),
      ),
    );
  }


  DropdownButton languageChooser() {
    return DropdownButton<String>(
      hint: Text('please_choose_a_language'.tr),
      value: Get.locale?.languageCode,
      onChanged: (String? newValue) {
        if (newValue != null) {
          TranslationService.setLocale(Locale(newValue));
        }
      },
      items: TranslationService.supportedLocales.map((Locale locale) {
        return DropdownMenuItem<String>(
          value: locale.languageCode,
          child: Text(locale.toString()),
        );
      }).toList(),
    );
  }
}
