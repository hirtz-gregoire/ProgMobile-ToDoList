import 'package:flutter/material.dart';
import 'package:todolist/screens/tasks_master.dart';

class ToDoListApp extends StatefulWidget {
  @override
  _ToDoListAppState createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksMaster(),
    );
  }
}