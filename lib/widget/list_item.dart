import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomanager/models/task_data.dart';

class TaskItem extends StatelessWidget {
  TaskItem({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkBoxCallback,
  });

  final String taskTitle;
  final bool isChecked;
  final Function checkBoxCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        onLongPress: () {
          Provider.of<TaskData>(context, listen: false).deleteTask(taskTitle);
        },
        title: Text(
          taskTitle,
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 20,
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
            decorationColor: Colors.blueGrey[900],
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.blueGrey[900],
          checkColor: Color(0xFFD3EEE8),
          onChanged: (bool? value) => checkBoxCallback(value),
        ),
      ),
    );
  }
}
