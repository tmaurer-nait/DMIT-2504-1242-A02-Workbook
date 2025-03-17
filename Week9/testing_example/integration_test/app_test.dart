import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-end main app tests', () {
    testWidgets(
      'tap on floating action button, verify name and email',
      (tester) async {
        // Load app widget
        await tester.pumpWidget(MainApp());

        // verify finders find nothing
        expect(find.text('Name: Tom Maurer'), findsNothing);
        expect(find.text('Email: tmaurer@nait.ca'), findsNothing);

        // tap on button
        final fab = find.byType(FloatingActionButton);
        await tester.tap(fab);

        // render frames
        await tester.pumpAndSettle();

        // verify name and email are visible
        expect(find.text('Name: Tom Maurer'), findsOneWidget);
        expect(find.text('Email: tmaurer@nait.ca'), findsOneWidget);
      },
    );
  });
}
