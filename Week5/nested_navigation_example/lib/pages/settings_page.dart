import 'package:flutter/material.dart';
import 'package:nested_navigation_example/routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Navigation
              },
              child: Text('Go to option 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Navigation
              },
              child: Text('Go to option 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement Navigation
              },
              child: Text('Go to option 3'),
            ),
          ],
        ),
      ),
    );
  }
}
