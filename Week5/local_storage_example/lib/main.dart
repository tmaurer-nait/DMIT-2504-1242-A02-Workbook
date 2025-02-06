import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Implement a light and dark mode toggle using shared_preferences
// TODO: Reimplement the Dog Like/Dislike App
// TODO: Save the last loaded dog to local file storage
// TODO: Save the likes and dislikes using shared_preferences

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _darkmode = false;

  Future<bool> _readDarkModeFromSharedPrefs() async {
    // get the prefs instance
    final prefs = await SharedPreferences.getInstance();
    // get the darkmode from prefs, if it doesn't exist return null
    return prefs.getBool('darkMode') ?? false;
  }

  @override
  void initState() {
    super.initState();
    _readDarkModeFromSharedPrefs().then((value) {
      setState(() {
        _darkmode = value;
      });
    });
  }

  Widget _buildDarkModeSwitch() {
    return SwitchListTile(
        title: Text('Dark Mode:'),
        value: _darkmode,
        onChanged: (value) async {
          setState(() {
            _darkmode = value;
          });
          // Update the shared preferences
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('darkMode', value);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkmode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text('Local Storage Demo')),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _buildDarkModeSwitch(),
              SizedBox(
                height: 20,
              ),
              Text(_darkmode ? 'darkmode is ON' : 'darkmode is OFF'),
            ],
          ),
        ),
      ),
    );
  }
}
