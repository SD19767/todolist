import 'package:flutter_learn_getx/services/task_service.dart';
import 'package:get/get.dart';

class ListViewController extends GetxController {
  final TaskService taskService = Get.find<TaskService>();
}