import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomanager/models/task_data.dart';
import 'package:todomanager/models/tasks.dart';
import 'package:todomanager/screens/add_task_screen.dart';
import 'package:todomanager/widget/list_item.dart';
import 'package:todomanager/widget/task_list.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[900],
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(addTaskCallback: (newTaskTitle) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                }),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Color(0xFFD3EEE8),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFD3EEE8),
                  radius: 40,
                  child: Icon(
                    Icons.list,
                    color: Colors.blueGrey[900],
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'TaskCraft',
                  style: TextStyle(
                    color: Color(0xFFD3EEE8),
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                  // textAlign: TextAlign.right,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Color(0xFFD3EEE8),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  // textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD3EEE8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}
