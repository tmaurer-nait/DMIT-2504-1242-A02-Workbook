import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User extends ChangeNotifier {
  User(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  String? _firstName;
  String? _lastName;

  String? get firstName => _firstName;
  String? get lastName => _lastName;

  set firstName(newFirstName) {
    _firstName = newFirstName;
    notifyListeners();
  }

  set lastName(newLastName) {
    _lastName = newLastName;
    notifyListeners();
  }
}

// We are using changeNotifierProvider with our user class
// Everywhere we import this file, the provider will be available
final userProvider = ChangeNotifierProvider<User>((ref) {
  return User('Jimothy', 'Defrog');
});
