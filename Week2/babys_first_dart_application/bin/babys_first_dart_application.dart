import 'dart:io';

import 'package:babys_first_dart_application/input_helpers.dart';

void main(List<String> arguments) {
  var name = prompt('Hello! What is your name?');

  var naitRating = promptInt('How do you like NAIT (1-5)?');

  stdout.writeln('Hello $name! You rate NAIT ${naitRating / 5 * 100}%');
}
