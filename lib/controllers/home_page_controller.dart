import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/services/task_service.dart';


class HomePageController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();
  var addTaskButtonPressed = false.obs;
  var selectedLanguage = Get.locale!.languageCode.obs;


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

  set changeLanguage(String lang) {
    Locale locale = new Locale(lang);
    Get.updateLocale(locale);
    selectedLanguage.value = lang;
  }
}
