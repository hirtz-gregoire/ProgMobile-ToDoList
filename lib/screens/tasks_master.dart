import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/tasks_provider.dart';
import 'package:todolist/services/task_service.dart';
import 'package:todolist/widgets/task_preview.dart';

class TasksMaster extends StatefulWidget {
  @override
  _TasksMasterState createState() => _TasksMasterState();
}

class _TasksMasterState extends State<TasksMaster> {
  final TaskService _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TasksProvider>(
        builder: (context, tasksProvider, child) {
          if (tasksProvider.tasks.isEmpty) {
            tasksProvider.load(); // Charger les tâches une fois au début
            return Center(child: CircularProgressIndicator());
          }
          else {
            return ListView.builder(
              itemCount: tasksProvider.tasks.length,
              itemBuilder: (context, index) {
                final task = tasksProvider.tasks[index];
                return TaskPreview(task: task);
              },
            );
          }
        },
      ),
    );
  }
}
