import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/TodoRepository.dart';
import 'Todo.dart';
import 'locator.dart';
import 'dart:math';

void main() {
  setup();
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Todo? todo = null;
  TodoRepository todoRepo = GetIt.I.get<TodoRepository>();
  Future<void> _getTodo() async {
    //Todo todo = await getIt.get<TodoController>().getTodo();
    Todo todo = await TodoRepository().getTodo();

    setState(() {
      this.todo = todo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            floatingActionButton: IconButton(
                onPressed: _getTodo, icon: const Icon(Icons.change_circle)),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget1(),
                TextWidget2(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                        "In Flutter, recomposition is cheap?  Is this going to inefficient for larger apps later on?"),
                  ),
                ),
                (todo == null)
                    ? Center(child: (Text("press the button to get a todo")))
                    : Center(child: Text(todo.toString())),
              ],
            )));
  }
}

class TextWidget1 extends StatefulWidget {
  const TextWidget1({super.key});

  @override
  State<TextWidget1> createState() => _TextWidget1State();
}

class _TextWidget1State extends State<TextWidget1> {
  @override
  Widget build(BuildContext context) {
    return Text("stateful = " + Random().nextInt(1000).toString());
  }
}

class TextWidget2 extends StatelessWidget {
  const TextWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("stateless = " + Random().nextInt(1000).toString());
  }
}
