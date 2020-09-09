import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks;

  TaskData() {
    _tasks = [
      Task(name: 'Buy Milk'),
      Task(name: 'Buy Bread'),
      Task(name: 'Buy Eggs'),
    ];
  }

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String title) {
    _tasks.add(Task(name: title));
    notifyListeners();
  }

  void toggleCheckbox(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
