import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function onToggle;
  final Function onDelete;
  final Function onEdit;

  TaskItem({
    required this.task,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isDone,
        onChanged: (newValue) {
          onToggle();
        },
      ),
      title: task.isDone
          ? Text(
              task.title,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
              ),
            )
          : Text(
              task.title,
            ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              String? newTaskName = await Navigator.pushNamed(
                context,
                '/edit_task',
                arguments: task.title,
              );
              if (newTaskName != null) {
                onEdit(newTaskName);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}
