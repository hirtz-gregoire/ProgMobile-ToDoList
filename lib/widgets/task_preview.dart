import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/task_details.dart';

class TaskPreview extends StatelessWidget {
  final Task task;

  TaskPreview({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title ?? 'No Title'),
      subtitle: Text(task.content),
      tileColor: task.completed ? Colors.green : Colors.red,
      leading: Icon(task.completed ? Icons.check_circle : Icons.radio_button_unchecked),
      onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetails(task: task),
          ),
        );
      },
    );
  }
}
