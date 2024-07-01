import 'package:flutter_learn_getx/controllers/edit_page_controller.dart';
import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';
import 'package:flutter_learn_getx/controllers/home_page_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<EditPageController>(() => EditPageController(id: Get.parameters['id']));
  }
}