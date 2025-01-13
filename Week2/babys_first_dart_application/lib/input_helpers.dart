import 'dart:io';

String prompt(String message) {
  // output the prompt message
  stdout.writeln(message);

  // collect the user input
  var userInput = stdin.readLineSync();

  // return the user input, handling null safety
  return userInput ?? '';
}

int promptInt(String message) {
  // output the prompt message
  var userInput = prompt(message);

  var isValid = false;

  late int returnVal;

  // while the user does not input an int, reprompt them
  while (!isValid) {
    try {
      returnVal = int.parse(userInput);
      isValid = true;
    } catch (e) {
      userInput = prompt('Invalid input, please enter an int');
    }
  }

  // Once an int has been input return it
  return returnVal;
}
