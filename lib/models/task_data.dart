import 'package:flutter/foundation.dart';
import 'package:todomanager/models/tasks.dart';
import 'dart:collection';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskData extends ChangeNotifier {
  late Database _database;

  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  TaskData() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'tasks_database.db'),
      onCreate: (db, version) async {
        print("Creating database...");
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER)',
        );
        print("Database created.");
      },
      version: 2, // Change the version number
    );

    await loadTasks();
  }

  Future<void> loadTasks() async {
    final List<Map<String, dynamic>> maps = await _database.query('tasks');

    _tasks = List.generate(
      maps.length,
      (i) => Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: maps[i]['isDone'] == 1,
      ),
    );

    notifyListeners();
  }

  Future<void> addTask(String newTaskTitle) async {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();

    await _database.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void toggleDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(String taskTitle) {
    _tasks.removeWhere((task) => task.name == taskTitle);
    notifyListeners();
  }
}
