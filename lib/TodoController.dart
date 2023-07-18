import 'Todo.dart';
import 'TodoRepository.dart';
import 'locator.dart';

abstract class ITodoController {
  Future<Todo> getTodo();
}

class TodoController implements ITodoController {
  @override
  Future<Todo> getTodo() async {
    return getIt.get<TodoRepository>().getTodo();
  }
}
