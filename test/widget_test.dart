// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ScaffoldApp());

    // Verify that our counter starts at 0.
    expect(find.text('Hello Word'), findsOneWidget);
    expect(find.text('Light Mode'), findsNothing);

    // Tap the 'settings' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('Hello Word'), findsOneWidget);
    expect(find.text('Light Mode'), findsOneWidget);
  });
}
