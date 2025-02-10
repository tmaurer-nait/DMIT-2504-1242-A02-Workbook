class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({required this.id, required this.name, required this.age});

  // Create a ToMap method
  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  // Create a fromMap factory constructor
  factory Dog.fromMap(Map<String, Object?> dogMap) {
    return Dog(
      id: dogMap['id'] as int,
      name: dogMap['name'] as String,
      age: dogMap['age'] as int,
    );
  }
}
