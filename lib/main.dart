import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/tasks_provider.dart';
import 'package:todolist/widgets/todo_list_app.dart';

void main() {
  //runApp(ToDoListApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: ToDoListApp(),
    ),
  );
}
