import 'package:flutter/material.dart';
import 'package:nested_navigation_example/pages/settings/option1_page.dart';
import 'package:nested_navigation_example/pages/settings/option2_page.dart';
import 'package:nested_navigation_example/pages/settings/option3_page.dart';
import 'package:nested_navigation_example/pages/settings/routes.dart' as routes;
import 'package:nested_navigation_example/pages/settings_page.dart';

class SettingsManager extends StatefulWidget {
  final String subRoute;

  const SettingsManager({required this.subRoute, super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings'),
      ),
      body: Navigator(
        initialRoute: widget.subRoute,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page = SizedBox.shrink();

    switch (settings.name) {
      case routes.settingsHomeRoute:
        page = SettingsPage();
        break;
      case routes.settingsOption1Route:
        page = Option1Page();
        break;
      case routes.settingsOption2Route:
        page = Option2Page();
        break;
      case routes.settingsOption3Route:
        page = Option3Page();
        break;
    }

    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
