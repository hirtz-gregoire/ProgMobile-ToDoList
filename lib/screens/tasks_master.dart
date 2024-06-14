import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/tasks_provider.dart';
import 'package:todolist/screens/task_form.dart';
import 'package:todolist/widgets/task_preview.dart';

class TasksMaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TasksProvider>(
        builder: (context, tasksProvider, child) {
          if (tasksProvider.tasks.isEmpty) {
            tasksProvider.load(); // Charger les tâches une fois au début
            return Center(child: CircularProgressIndicator());
          } else {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task? newTask = await showDialog<Task?>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('New Task'),
                content: TaskForm(formMode: FormMode.Add),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );

          // Add the new task if it's not null
          if (newTask != null) {
            Provider.of<TasksProvider>(context, listen: false).addTask(newTask);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
