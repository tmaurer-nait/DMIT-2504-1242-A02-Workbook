import 'package:app_state_example/models/user.dart';
import 'package:app_state_example/widgets/user_notifier.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

User user = User('Tim', 'Morer');

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Need to wrap the MaterialApp because of Navigator use
    // -- Navigator is created by MaterialApp and won't pass
    // down a contet that can be used by pushed pages to find
    // the UserNotifier
    return UserNotifier(
      user: user,
      child: Builder(builder: (context) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: HomePage(),
            ),
          ),
        );
      }),
    );
  }
}
