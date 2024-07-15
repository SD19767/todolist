import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/services/task_service.dart';


class HomePageController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();
  var addTaskButtonPressed = false.obs;
  var selectedLanguage = Get.locale!.languageCode.obs;

  const: compile 時，定義完成
  final runtime 才定義好，定義後不能 assign let~~~
  var ：runtime 才定義好，定義後可以 assign
  dynamic : AnyObject

  HomePageController() {
    addTaskButtonPressed.listen((pressed) {
      if (pressed) {
        addTask();
        addTaskButtonPressed.value = false;
      }
    });
  }

  void addTask() {
    Get.toNamed('/edit', parameters: {'id': ''});
  }

  void triggerAddTask() {
    addTaskButtonPressed.value = true;
  }
}
