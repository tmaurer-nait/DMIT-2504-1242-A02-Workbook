import 'dart:math';
import 'package:flutter/material.dart';
import 'package:local_sql_example/models/dog.dart';
import 'package:local_sql_example/managers/dog_db_manager.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  final dogManager = DogDbManager.instance;
  final randomGenerator = Random();

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Dog> dogs = [];
  int lastId = 0;

  @override
  void initState() {
    super.initState();
    // Load all existing dogs
    _loadDogs();
  }

  @override
  void dispose() {
    super.dispose();
    widget.dogManager.closeDB();
  }

  Future<void> _loadDogs() async {
    try {
      // Get all the dogs from the db
      var dbDogs = await widget.dogManager.getDogs();
      // Then set the state to show the new dogs
      setState(() {
        dogs = dbDogs;
        lastId = dbDogs.isNotEmpty ? dbDogs.last.id : 0;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addRandomDog() async {
    try {
      final newDog = Dog(
        id: lastId + 1,
        name: 'Dog ${lastId + 1}',
        age: widget.randomGenerator.nextInt(17),
      );
      await widget.dogManager.insertDog(newDog);
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeDog(int id) async {
    try {
      await widget.dogManager.deleteDog(id);
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dog List")),
        body: ListView.separated(
          itemBuilder: (context, index) {
            var dog = dogs[index];
            return ListTile(
              title: Text('${dog.name} - ${dog.age}'),
              onTap: () {
                _removeDog(dog.id);
              },
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: dogs.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addRandomDog,
          child: Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
