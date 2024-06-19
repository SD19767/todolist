import 'dart:convert';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskService extends GetxController {
  final tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadTasksFromLocal();
    tasks.listen((_) {
      _saveTasksToLocal();
    });
  }

  void createTask(String taskName,TaskStatus status) {
    tasks.add(TaskModel(id: _getNewID(), taskName: taskName, status: status));
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void updateTask(int index, TaskModel task){
    tasks.insert(index, task);
  }

  int _getNewID() {
    if (tasks.isNotEmpty) {
      return tasks.last.id + 1;
    } else {
      return 0;
    }
  }

  Future<void> _loadTasksFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final List<dynamic> tasksJson = json.decode(tasksString);
      final loadedTasks = tasksJson.map((taskJson) => TaskModel.fromJson(taskJson)).toList();
      tasks.assignAll(loadedTasks);
    }
  }

  Future<void> _saveTasksToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = json.encode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', tasksString);
  }
}