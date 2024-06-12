import 'package:faker/faker.dart';
import '../models/task.dart';

class TaskService {
  final Faker _faker = Faker();

  Future<List<Task>> fetchTasks() async {
    List<Task> tasks = [];
    for (int i = 0; i < 100; i++) {
      tasks.add(Task(
        content: _faker.lorem.sentence(),
        completed: _faker.randomGenerator.boolean(),
      ));
    }
    return tasks;
  }
}
