class Task {
  final int? id;
  final String name;
  bool isDone;

  Task({this.id, required this.name, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone ? 1 : 0, // Convert bool to integer for SQLite
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      isDone: map['isDone'] == 1,
    );
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
