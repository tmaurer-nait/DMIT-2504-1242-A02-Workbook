import 'package:flutter/material.dart';
import 'package:nested_navigation_example/pages/settings/routes.dart' as routes;

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
                Navigator.of(context).pushNamed(routes.settingsOption1Route);
              },
              child: Text('Go to option 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(routes.settingsOption2Route);
              },
              child: Text('Go to option 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(routes.settingsOption3Route);
              },
              child: Text('Go to option 3'),
            ),
          ],
        ),
      ),
    );
  }
}
