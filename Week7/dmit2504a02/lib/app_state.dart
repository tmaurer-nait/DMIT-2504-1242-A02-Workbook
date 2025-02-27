import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:dmit2504a02/models/todo.dart';

import 'firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  User? _user;
  User? get user => _user;
  set user(User? user) {
    if (user == null) {
      throw ArgumentError('Cannot set the user to null');
    }
    _user = user;
  }

  List<Todo>? _todos;
  List<Todo>? get todos {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }
    return _todos;
  }

  set todos(List<Todo>? todos) {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }
    if (todos == null) {
      throw ArgumentError('Cannot set the todos to null');
    }
    _todos = todos;
  }

  Future<void> init() async {
    // Call this before app start to connect to firebase
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        // update the app state to store the user info
        this.user = user;

        // TODO: fetch that users todos and store them in the state
        todos = [
          Todo(completed: false, description: 'Buy eggs'),
          Todo(description: 'buy milk', completed: true),
          Todo(description: 'buy cheese', completed: false)
        ];
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}
