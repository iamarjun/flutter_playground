import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        UnmodifiableListView<Task> tasks = taskData.tasks;
        return ListView.builder(
          padding: EdgeInsets.only(top: 20.0),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              name: tasks[index].name,
              isChecked: tasks[index].isDone,
              toggleCheckbox: (value) {
                taskData.toggleCheckbox(index);
              },
              onDelete: () {
                taskData.deleteTask(index);
              },
            );
          },
        );
      },
    );
  }
}
