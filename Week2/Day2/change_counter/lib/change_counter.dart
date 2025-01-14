import 'dart:io';

/// Prompt the user for their change
/// [Returns] an ordered list of coins (pennies, nickels, dimes, quarters, loonies, toonies)
List<int> promptForChange() {
  List<int> output = [];
  // Create the coin types
  const List<String> COIN_TYPES = [
    'pennies',
    'nickels',
    'dimes',
    'quarters',
    'loonies',
    'toonies'
  ];

  // For each coin type
  // Option 1:
  // for (var i = 0; i < COIN_TYPES.length; i++) {

  // }
  for (String coinType in COIN_TYPES) {
    // Prompt the user
    stdout.writeln('How many $coinType do you have?');

    late int coinCount;

    // Validate their response
    try {
      coinCount = int.parse(stdin.readLineSync()!);
    } catch (e) {
      throw Exception('User did not input an integer');
    }

    if (coinCount < 0) {
      throw Exception('User entered negative value for coin count');
    }

    // Add the coin count to the output
    output.add(coinCount);
  }

  return output;
}

int getTotal({required List<int> coinCounts}) {
  int total = 0;

  total += coinCounts[0];
  total += coinCounts[1] * 5;
  total += coinCounts[2] * 10;
  total += coinCounts[3] * 25;
  total += coinCounts[4] * 100;
  total += coinCounts[5] * 200;

  return total;
}
