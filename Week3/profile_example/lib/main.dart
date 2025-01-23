import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: generateDarkTheme(lightTheme),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Layout Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileHeading(),
              ClipOval(
                child: Image.asset(
                  'assets/images/nathan.jpg',
                  height: 250,
                  width: 250,
                ),
              ),
              Text(
                'Tom Maurer',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ProfileInfo('Role', 'Instructor'),
              ProfileInfo('Team', 'DMIT'),
              ProfileInfo('Handle', 'tmaurer'),
              ProfileInfo('Supervisor', 'Nathan Humphrey'),
            ],
          ),
        ),
      ),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
    ),
  ),
);

ThemeData generateDarkTheme(ThemeData lightTheme) {
  return lightTheme.copyWith(
      colorScheme: ColorScheme.dark(),
      scaffoldBackgroundColor: Colors.blueGrey);
}

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Employee Profile',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Text(
              '$label: ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ));
  }
}
