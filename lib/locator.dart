import 'package:get_it/get_it.dart';

import 'TodoController.dart';
import 'TodoRepository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ITodoRepository>(() => TodoRepository());
  getIt.registerLazySingleton<ITodoController>(() => TodoController());

  //GetIt.I.registerLazySingleton<TodoController>(() => TodoController());
}
