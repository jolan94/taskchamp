import 'package:flutter/material.dart';
import 'package:taskchamp/models/task.dart';
import 'package:taskchamp/routes.dart';
import 'package:taskchamp/screens/task_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Champ'),
      ),
      body: TaskList(tasks: tasks),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addTask).then((newTask) {
            if (newTask != null && newTask is Task) {
              setState(() {
                tasks.add(newTask);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
