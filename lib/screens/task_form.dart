import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/providers/tasks_provider.dart';

enum FormMode {
  Add,
  Edit,
}

class TaskForm extends StatefulWidget {
  final FormMode formMode;
  final Task? task;

  TaskForm({required this.formMode, this.task});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late bool _completed;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _contentController = TextEditingController(text: widget.task?.content ?? '');
    _completed = widget.task?.completed ?? false;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some content';
                }
                return null;
              },
            ),
            SwitchListTile(
              title: Text('Completed'),
              value: _completed,
              onChanged: (bool value) {
                setState(() {
                  _completed = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Task updatedTask = Task(
                    pid: widget.task?.id ?? null,
                    title: _titleController.text.trim().isEmpty ? null : _titleController.text,
                    content: _contentController.text,
                    completed: _completed,
                  );
                  
                  print("===========>"+updatedTask.toString());
                  
                  if (widget.formMode == FormMode.Add) {
                    Provider.of<TasksProvider>(context, listen: false).addTask(updatedTask);
                  } else if (widget.formMode == FormMode.Edit) {
                    Provider.of<TasksProvider>(context, listen: false).updateTask(updatedTask);
                  }

                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
