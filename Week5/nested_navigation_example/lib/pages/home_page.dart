import 'package:flutter/material.dart';
import 'package:nested_navigation_example/routes.dart' as routes;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page Body'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(routes.settingsHomeRoute);
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
