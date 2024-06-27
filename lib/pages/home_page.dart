import 'package:flutter/material.dart';
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
          title: Text("Translation"),
          centerTitle: false,
          actions: [languageChooser()],
        ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.getEdgeInsets()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TODO List Demo App',
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
                  onPressed: _controller.triggerAddTask,
                  text: 'Add Task',
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
        isExpanded: false,
        hint: Text('Please choose a location'), // Not necessary for Option 1
        value: _controller.selectedLanguage.value,
        onChanged: (symbol) {
          _controller.changeLanguage = symbol ?? languages.first.symbol;
        },
        items: languages.map((LanguageModel languageModel) {
          print(languageModel.language);
          return DropdownMenuItem<String>(
            value: languageModel.symbol,
            child: new Text(languageModel.language),
          );
        }).toList());
  }
}
