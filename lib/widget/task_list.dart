import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomanager/models/task_data.dart';
import 'package:todomanager/models/tasks.dart';
import 'package:todomanager/widget/list_item.dart';

import '../models/task_data.dart';

class TaskList extends StatelessWidget {
  TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskItem(
              taskTitle: TaskData.tasks[index].name,
              isChecked: TaskData.tasks[index].isDone,
              checkBoxCallback: (checkboxState) {
                TaskData.toggleDone(index);
              },
            );
          },
          itemCount: TaskData.taskCount,
        );
      },
    );
  }
}
