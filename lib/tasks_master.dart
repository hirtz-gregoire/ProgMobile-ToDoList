import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import 'models/task.dart';

class  TasksMaster extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _TasksMaster();
  }
}


class _TasksMaster extends State<TasksMaster>{

  Future<List<Task>> _fetchTasks() async {

    await Future.delayed(Duration(seconds: 2));

    List<Task> tasks = [];


    for (int i=0; i<100; i++){

      List<String> words = faker.lorem.words(10);
      String c = "";
      words.forEach((word) {c = c+" "+word;});

      Task t = Task(content: c, completed: random.boolean());
      tasks.add(t);
    }

    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tasks Master'),
        ),
        body: FutureBuilder<List<Task>>(
          future: _fetchTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No tasks found'));
            } else {
              List<Task> tasks = snapshot.data!;
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  Task task = tasks[index];
                  return TaskPreview(task: task);
                },
              );
            }
          },
        ),
      )
    );
  }
}

class TaskPreview extends StatelessWidget {
  final Task task;
  TaskPreview({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title ?? 'No Title'),
      subtitle: Text(task.content),
      trailing: Icon(
        task.completed ? Icons.check_circle : Icons.check_circle_outline,
        color: task.completed ? Colors.green : Colors.grey,
      ),
    );
  }
}

