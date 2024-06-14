
  import 'package:flutter/material.dart';
  import 'package:todolist/models/task.dart';

  class TasksProvider with ChangeNotifier {
    final List<Task> _tasks = [];

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
  }