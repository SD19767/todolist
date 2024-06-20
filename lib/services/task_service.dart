import 'dart:convert';
import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskService extends GetxController {
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadTasksFromLocal();
    tasks.listen((_) {
      _saveTasksToLocal();
    });
  }

  Task getNewBlankTask() {
    return Task(id: _getNewID(), name: '', status: TaskStatus.todo);
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void updateTask(Task task){
    final index = getIndexByTask(task);
    tasks.insert(index, task);
  }

  void addTask(Task task) {
    tasks.add(task);
  }

  int _getNewID() {
    if (tasks.isNotEmpty) {
      return tasks.last.id + 1;
    } else {
      return 0;
    }
  }

  int getIndexByTask(Task task) {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].id == task.id) {
        return i;
      }
    }
    return tasks.length;
  }

  Future<void> _loadTasksFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final List<dynamic> tasksJson = json.decode(tasksString);
      final loadedTasks = tasksJson.map((taskJson) => Task.fromJson(taskJson)).toList();
      tasks.assignAll(loadedTasks);
    }
  }

  Future<void> _saveTasksToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = json.encode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', tasksString);
  }
}