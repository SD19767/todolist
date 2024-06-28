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

  void removeTaskBy({required Task task}) {
    if (_isTaskExistByTask(task)) {
      final removeIndex = _getIndexByTask(task);
      tasks.removeAt(removeIndex);
    } else {
      throw IndexError.withLength;
    }
  }

  void save(Task task) {
    if (_isTaskExistByTask(task)) {
      _updateTask(task);
    } else {
      _addTask(task);
    }
  }

  Task getTaskBy({required TaskId? id}) {
    if (id == null) {
      return _getNewBlankTask();
    }
    return _getTaskBy(id: id) ?? _getNewBlankTask();
  }

  Task _getNewBlankTask() {
    return Task(id: _getNewID(), name: '', status: TaskStatus.todo);
  }

  void _updateTask(Task task) {
    final index = _getIndexByTask(task);
    tasks[index] = task;
  }

  void _addTask(Task task) {
    task.id = _getNewID();
    tasks.add(task);
  }

  TaskId _getNewID() {
    if (tasks.isNotEmpty) {
      int intId = int.tryParse(tasks.last.id) ?? -1;
      intId += 1;
      return intId.toString();
    } else {
      return '0';
    }
  }

  int _getIndexByTask(Task task) {
    return tasks.indexWhere((t) => t.id == task.id);
  }

  bool _isTaskExistByTask(Task task) {
    return _getTaskBy(id: task.id) != null;
  }

  Task? _getTaskBy({required TaskId id}) {
    return tasks.firstWhereOrNull((task) => task.id == id);
  }

  Future<void> _loadTasksFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final List<dynamic> tasksJson = json.decode(tasksString);
      final loadedTasks =
          tasksJson.map((taskJson) => Task.fromJson(taskJson)).toList();
      tasks.assignAll(loadedTasks);
    }
  }

  Future<void> _saveTasksToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString =
        json.encode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', tasksString);
  }
}
