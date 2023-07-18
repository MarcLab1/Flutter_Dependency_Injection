import 'dart:math';

import 'Todo.dart';
import 'locator.dart';

abstract class ITodoRepository {
  Future<Todo> getTodo();
}

class TodoRepository implements ITodoRepository {
  @override
  Future<Todo> getTodo() async {
    return todos[Random().nextInt(5)];
  }
}

var todos = [
  Todo(1, "one"),
  Todo(2, "toooo"),
  Todo(3, "free"),
  Todo(4, "fourrrrr"),
  Todo(5, "five"),
];
