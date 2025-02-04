import 'package:flutter/material.dart';
import 'package:nested_navigation_example/routes.dart' as routes;
import 'package:nested_navigation_example/pages/home_page.dart';
import 'package:nested_navigation_example/pages/settings/settings_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case routes.homeRoute:
            page = HomePage();
            break;
          case routes.settingsHomeRoute:
            page = SettingsManager(subRoute: settings.name!.substring(10));
            break;
          default:
            throw Exception('Unknown route used: ${settings.name}');
        }

        return MaterialPageRoute(
            builder: (context) => page, settings: settings);
      },
    );
  }
}
