import 'package:flutter_learn_getx/controllers/edit_page_controller.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:flutter_learn_getx/pages/edit_page.dart';

class HomePageController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();
  final EditPageController editPageController = Get.find<EditPageController>();
  var addTaskButtonPressed = false.obs;

  HomePageController() {
    addTaskButtonPressed.listen((pressed) {
      if (pressed) {
        addTask();
        addTaskButtonPressed.value = false;
      }
    });
  }

  void addTask() {
    var task = taskService.getNewBlankTask();
    navigateToEditPage(EditPageType.add, task);
  }

  void navigateToEditPage(EditPageType editPageType, Task task) {
    Get.toNamed('/edit');
  }

  void triggerAddTask() {
    addTaskButtonPressed.value = true;
  }
}
