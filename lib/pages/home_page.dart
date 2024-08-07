import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/services/translation_service.dart';
import 'package:flutter_learn_getx/widgets/task_list_view.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';
import 'package:flutter_learn_getx/widgets/custom_outlined_button.dart';

class HomePage extends GetView<HomePageController> {
  String? text = '123';
  HomePage({super.key,this.text});

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
            const SizedBox(height: 16),
            Container(
              color: const Color(0xFFFDF6E3),
              child: Text(
                'do_it_now'.tr,
                style: TextStyle(fontSize: SizeConfig.getTitleSize()),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomOutlinedButton(
                  onPressed: controller.triggerAddTask,
                  text: 'add_task'.tr,
                )
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TaskListView(tasks: controller.taskService.tasks),
            )
          ],
        ),
      ),
    );
  }

  DropdownButton languageChooser() {
    return DropdownButton<LanguageCode>(
      hint: Text('please_choose_a_language'.tr),
      value: TranslationService.currentLanguageCode,
      onChanged: (languageCode) => languageCode != null
          ? TranslationService.setLocale(languageCode)
          : null,
      items: LanguageCode.values
          .map((LanguageCode languageCode) => DropdownMenuItem<LanguageCode>(
                value: languageCode,
                child: Text(languageCode.key),
              ))
          .toList(),
    );
  }
}
