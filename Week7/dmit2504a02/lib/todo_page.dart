import 'package:dmit2504a02/app_state.dart';
import 'package:flutter/material.dart';

import 'package:dmit2504a02/models/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({required this.appState, super.key});

  final ApplicationState appState;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> _todoList = [];

  @override
  void initState() {
    super.initState();

    // Initially set all the todos to be equal to the app state todos (in line with firestore)
    setState(() {
      // We are expecting todos but that may not be the case, depending on how you created users
      if (widget.appState.todos == null) {
        _todoList = [];
      } else {
        _todoList = widget.appState.todos!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: _buildList(_todoList),
    );
  }

  Widget _buildList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Dismissible(
          key: UniqueKey(),
          child: ListTile(
            title: Text(
              todo.description,
              style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: Checkbox(
                value: todo.completed,
                onChanged: (value) {
                  setState(() {
                    todo.completed = value!;
                    // Update the appstate to change the firestore
                    widget.appState.updateTodo(todo: todo);
                  });
                }),
          ),
          onDismissed: (direction) {
            setState(() {
              todos.removeAt(index);
              // Update the appstate to change the firestore
              widget.appState.deleteTodo(todo: todo);
            });
          },
        );
      },
    );
  }
}
