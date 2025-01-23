import 'package:flutter/material.dart';
import 'package:profile_example/theme/theme.dart';
import 'package:profile_example/widgets/profile_heading.dart';
import 'package:profile_example/widgets/profile_info.dart';
import 'package:profile_example/widgets/profile_image.dart';

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
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Layout Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileHeading(),
              ProfileImage(imagePath: 'assets/images/nathan.jpg'),
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
