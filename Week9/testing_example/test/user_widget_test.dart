import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example/widgets/user_widget.dart';
import 'package:testing_example/models/user.dart';

void main() {
  late User user;
  late Widget app;

  setUp(() {
    user = User(name: 'Tom Maurer', email: 'tmaurer@nait.ca');

    app = MaterialApp(
      home: Scaffold(
        body: UserWidget(user: user),
      ),
    );
  });

  testWidgets('UserWidget displays the name and email of the user',
      (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(app);

    // Act(ish)
    // Find the widgets
    final nameFinder = find.text('Name: Tom Maurer');
    final emailFinder = find.text('Email: tmaurer@nait.ca');
    final fabFinder = find.byType(FloatingActionButton);

    // Assert that it's nothing at the start
    expect(nameFinder, findsNothing);
    expect(emailFinder, findsNothing);

    // Tap on the button
    await tester.tap(fabFinder);

    // Wait for renders
    await tester.pump(Duration(seconds: 1));

    // Assert that text is visible
    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
  });
}
