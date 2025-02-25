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
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
