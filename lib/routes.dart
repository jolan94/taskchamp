import 'package:flutter/material.dart';
import 'screens/get_started_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_task_screen.dart';
import 'screens/edit_task_screen.dart';

class Routes {
  static const String getStarted = '/';
  static const String home = '/home';
  static const String addTask = '/addTask';
  static const String editTask = '/editTask';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      getStarted: (_) => GetStartedScreen(),
      home: (_) => HomeScreen(),
      addTask: (_) => AddTaskScreen(),
      editTask: (_) => EditTaskScreen(),
    };
  }
}
