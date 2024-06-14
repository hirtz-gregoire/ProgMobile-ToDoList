
  import 'package:flutter/material.dart';
  import 'package:todolist/models/task.dart';
import 'package:todolist/services/task_service.dart';

  class TasksProvider extends ChangeNotifier {
    final TaskService _taskService = TaskService();
    List<Task> _tasks = [];

    List<Task> get tasks => _tasks;

    void addTask(Task t) {
      _tasks.add(t);
      notifyListeners();
    }

    void removeTask(Task t) {
      _tasks.remove(t);
      notifyListeners();
    }

    Task? getTaskById(String id) {
      try {
        return _tasks.firstWhere((task) => task.id == id);
      } catch (e) {
        return null; // Retourne null si aucun élément ne correspond à l'ID
      }
    }

    void updateTask(Task updatedTask) {
      int index = _tasks.indexWhere((task) => task.id == updatedTask.id);
      if (index != -1) {
        _tasks[index] = updatedTask;
        notifyListeners();
      }
    }

    void load() async{
      try {
        _tasks = await _taskService.fetchTasks();
        notifyListeners();
      } catch (e) {
        print('Error fetching tasks: $e');
      }
    }
}