import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomanager/models/task_data.dart';
import 'package:todomanager/widget/list_item.dart';
import 'package:todomanager/widget/task_list.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
    required addTaskCallback,
  });

  String? taskName = '';
  void Function(String?)? addTaskCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF354B57),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFD3EEE8),
                height: 3,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.blueGrey[900],
                border: UnderlineInputBorder(borderSide: BorderSide()),
              ),
              onChanged: (value) {
                taskName = value;
              },
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskName!);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Color(0xFFD3EEE8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
