import 'dart:convert';
import 'package:http/http.dart' as http;

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}

void main() {
  final url = 'https://jsonplaceholder.typicode.com/todos/1';

  http.get(Uri.parse(url)).then((response) {
    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      final todo = Todo.fromJson(jsonMap);
      print(todo);
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }).catchError((error) {
    print('Error: $error');
  });
}