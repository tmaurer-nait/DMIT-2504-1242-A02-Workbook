import 'package:flutter/material.dart';
import 'package:navigation_exercise/routes.dart' as routes;
import 'package:navigation_exercise/pages/page_one.dart';
import 'package:navigation_exercise/pages/page_two.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Using named routes now instead of decentralized routing
      routes: {
        routes.homeRoute: (context) => const PageOne(),
        routes.pageTwoRoute: (context) => const PageTwo(),
      },
    );
  }
}
