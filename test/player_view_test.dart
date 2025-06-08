import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:volei_project/ui/views/player_view.dart';

void main() {
  testWidgets('PlayerView should display and register a player',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: PlayerView()));

    // Verify initial state
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Number'), findsOneWidget);
    expect(find.text('Role'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);

    // Enter player details
    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '10');
    await tester.enterText(find.byType(TextField).at(2), 'Setter');

    // Tap the register button
    await tester.tap(find.text('Register'));
    await tester.pump();

    // Verify success message
    expect(find.text('Player successfully registered!'), findsOneWidget);
  });
}
