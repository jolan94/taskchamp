import 'package:flutter/material.dart';
import 'package:taskchamp/models/task.dart';
import 'package:taskchamp/routes.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({super.key, required this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return widget.tasks.isEmpty
        ? SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/empty.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text("Add task here...!")
              ],
            ),
          )
        : ListView.builder(
            itemCount: widget.tasks.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  widget.tasks[index].title,
                  style: TextStyle(
                    decoration: widget.tasks[index].isDone ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                value: widget.tasks[index].isDone,
                onChanged: (newValue) {
                  setState(() {
                    widget.tasks[index].isDone = newValue!;
                  });
                },
                secondary: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.editTask, arguments: widget.tasks[index])
                            .then((updatedTask) {
                          if (updatedTask != null && updatedTask is Task) {
                            setState(() {
                              widget.tasks[index] = updatedTask;
                            });
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Task?'),
                            content: const Text('Are you sure you want to delete this task?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        ).then((confirmed) {
                          if (confirmed) {
                            setState(() {
                              widget.tasks.removeAt(index);
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
  }
}
