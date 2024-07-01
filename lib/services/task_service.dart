import 'package:flutter_learn_getx/data_models/task_status.dart';
import 'package:flutter_learn_getx/data_models/task_model.dart';
import 'package:get/get.dart';
import '../provider/task_provider.dart';

class TaskService extends GetxController {
  final tasks = <Task>[].obs;
  final TaskProvider provider = TaskProvider();

  @override
  void onInit() {
    super.onInit();
    _initDB();
  }

  Future<void> _initDB() async {
    await provider.initDatabase();
    await _loadTasksFromDB();
    tasks.listen((_) {
      _saveTasksToDB();
    });
  }

  Future<void> _loadTasksFromDB() async {
    final loadedTasks = await provider.getAllTasks();
    tasks.assignAll(loadedTasks);
  }

  Future<void> _saveTasksToDB() async {
    await provider.deleteAllTasks();
    for (var task in tasks) {
      await provider.insertTask(task);
    }
  }

  void removeTaskBy({required Task task}) {
    if (_isTaskExistByTask(task)) {
      final removeIndex = _getIndexByTask(task);
      tasks.removeAt(removeIndex);
      provider.deleteTask(task.id);
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
    provider.updateTask(task);
  }

  void _addTask(Task task) {
    task.id = _getNewID();
    tasks.add(task);
    provider.insertTask(task);
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
}