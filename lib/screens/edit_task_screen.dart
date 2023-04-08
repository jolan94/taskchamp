import 'package:flutter/material.dart';
import 'package:taskchamp/models/task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task? task;

  EditTaskScreen({super.key, this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Task newtask = ModalRoute.of(context)!.settings.arguments as Task;
    titleController.text = newtask.title;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
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
                Navigator.pop(
                    context,
                    Task(
                      title: titleController.text,
                      isDone: newtask.isDone,
                    ));
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
