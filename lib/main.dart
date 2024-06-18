import 'package:flutter/material.dart';
import 'package:flutter_learn_getx/pages/edit_page.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';
import 'controllers/home_page_controller.dart';
import 'package:flutter_learn_getx/helpers/size_config.dart';

void main() {
  Get.put(TaskService());
  Get.put(HomePageController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetMaterialApp(
      home: EditPage(),
    );
  }
}
