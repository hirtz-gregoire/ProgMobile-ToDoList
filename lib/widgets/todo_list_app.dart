import 'package:flutter/material.dart';
import 'package:todolist/screens/task_form.dart';
import 'package:todolist/screens/tasks_master.dart';

class ToDoListApp extends StatefulWidget {
  @override
  _ToDoListAppState createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Tasks Master'),
        ),

        body: TasksMaster(),

      ),
    );
  }
}
