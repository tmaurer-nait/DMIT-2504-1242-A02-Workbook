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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
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

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const Text(
        'Employee Profile',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ));
  }
}
