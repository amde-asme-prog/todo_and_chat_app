import 'package:todo_chat_app/models/todo.dart';

class TodoData {
  final List<Todo> todos;

  TodoData(this.todos);
}

final List<Todo> todos = [
  Todo(
    title: 'Buy groceries',
    description: 'Buy groceries',
    date: DateTime.now(),
  ),
  Todo(
    title: 'Clean the house',
    description: 'Clean the house',
    date: DateTime.now(),
  ),
];

final todoData = TodoData(todos);
