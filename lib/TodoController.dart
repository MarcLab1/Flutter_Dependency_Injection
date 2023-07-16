import 'Todo.dart';
import 'TodoRepository.dart';
import 'locator.dart';

class TodoController {
  Future<Todo> getTodo() async {
    return getIt.get<TodoRepository>().getTodo();
  }
}
