import 'package:flutter/material.dart';
import 'package:todomanager/screens/taskScreen.dart';
import 'package:provider/provider.dart';

import 'package:todomanager/models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.blueGrey[900],
        ),
        home: TaskScreen(),
      ),
    );
  }
}
