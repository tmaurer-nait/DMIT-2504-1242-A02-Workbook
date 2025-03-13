import 'package:test/test.dart';

import 'package:testing_example/models/user.dart';

void main() {
  group('User Tests', () {
    late User user;

    setUp(() {
      user = User(name: 'Tom Maurer', email: 'tmaurer@nait.ca');
    });

    test('User should have name and email', () {
      expect(user.name, 'Tom Maurer');
      expect(user.email, 'tmaurer@nait.ca');
    });

    test('toString() is overriden correctly', () {
      // Arrange
      var expected = 'name: Tom Maurer, email: tmaurer@nait.ca';
      String actual;

      // Act
      actual = user.toString();

      // Assert
      expect(actual, expected);
    });
  });
}
