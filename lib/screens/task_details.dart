import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatefulWidget {
  final Task task;

  TaskDetails({required this.task});

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late bool _completed;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _contentController = TextEditingController(text: widget.task.content);
    _completed = widget.task.completed;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.title ?? 'Task Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Completed:'),
                Switch(
                  value: _completed,
                  onChanged: (value) {
                    setState(() {
                      _completed = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
