import 'package:flutter/material.dart';
import 'package:taskchamp/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Task title',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String title = titleController.text;
                Task newTask = Task(title: title, isDone: false);
                Navigator.pop(context, newTask);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
