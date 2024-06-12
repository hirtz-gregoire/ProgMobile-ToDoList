import 'package:uuid/uuid.dart';

var uuid = const Uuid();

enum Priority {
  low,
  normal,
  high,
}

class Task{
  String? id;
  String content;
  bool completed;
  String? title;
  Priority priority;


  Task({
    String? pid,
    required this.content,
    this.completed = false,
    this.title,
    this.priority = Priority.normal,
  }):
        id= pid ?? uuid.v4(); // Génère un UUID si pid n'est pas fourni

  @override
  String toString() {
    return "Task(content:$content, id:$id)";
  }
}