import 'package:flutter/material.dart';

class ToDoListApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _ToDoListAppState();
  }

}



class _ToDoListAppState extends State<ToDoListApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ToDo List'),
        ),
        body: Center(
          child: Text('Hello, world!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("bouton clique");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}