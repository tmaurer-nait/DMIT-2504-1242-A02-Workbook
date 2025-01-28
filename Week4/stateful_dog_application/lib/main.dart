import 'package:flutter/material.dart';
import 'package:stateful_dog_application/widgets/page_title.dart';
import 'package:stateful_dog_application/widgets/random_dog.dart';

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
          body: Center(
            child: Column(
              children: [
                PageTitle('Do you like this dog?'),
                RandomDogImage(),
              ],
            ),
          ),
        ));
  }
}
