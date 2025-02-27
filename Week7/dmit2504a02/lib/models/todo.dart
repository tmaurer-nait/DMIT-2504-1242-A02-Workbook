import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo({required this.description, required this.completed, this.id});

  String description;
  bool completed;
  String? id;

  // Create a from firestore factory constructor
  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Todo(
        completed: data?['completed'],
        description: data?['description'],
        // capture the document id for the todo id
        id: snapshot.id);
  }
  // Create a toMap method
  Map<String, dynamic> toMap() {
    return {'description': description, 'completed': completed};
  }
}
