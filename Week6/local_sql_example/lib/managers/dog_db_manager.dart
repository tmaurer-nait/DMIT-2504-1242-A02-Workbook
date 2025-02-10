import 'package:local_sql_example/models/dog.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DogDbManager {
  // Private constructor to allow for singleton
  const DogDbManager._();

  // Singleton instance
  static const DogDbManager instance = DogDbManager._();

  static const _dbName = 'dogs.db';
  static const _dbVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _connectToDB();
    return _database!;
  }

  Future<Database> _connectToDB() async {
    var dbPath = await getDatabasesPath();

    // Unstable way of making paths
    // var path = '$dbPath/$_dbName';

    var path = join(dbPath, _dbName);

    final database = openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      },
      version: _dbVersion,
    );
    return database;
  }

  Future<void> closeDB() async {
    final db = await database;
    db.close();
  }

  Future<List<Dog>> getDogs() async {
    final db = await database;

    final dogMaps = await db.query('dogs');

    // Option 1: List Generate
    // return List.generate(dogMaps.length, (i) {
    //   return Dog.fromMap(dogMaps[i]);
    // });

    // Option 2: list comprehension
    // return [for (final dogMap in dogMaps) Dog.fromMap(dogMap)];

    // Option 3: For loop
    List<Dog> output = [];
    for (final dogMap in dogMaps) {
      output.add(Dog.fromMap(dogMap));
    }
    return output;
  }

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}
