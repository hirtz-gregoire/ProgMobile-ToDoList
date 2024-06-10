// lib/models/task.dart

class Task {
  final int? id; // Optionnel
  final String content; // Requis
  final bool completed; // Requis
  final String? title; // Optionnel

  Task({
    this.id,
    required this.content,
    required this.completed,
    this.title,
  });

  // Convert a Task into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'completed': completed,
      'title': title,
    };
  }

  // Implement toString to make it easier to see information about each task when using the print statement.
  @override
  String toString() {
    return 'Task{id: $id, content: $content, completed: $completed, title: $title}';
  }
}
