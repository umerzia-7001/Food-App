import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_app/core/auth/widgets/login_button.dart';

void main() {
  testWidgets('finds exactly one widget', (WidgetTester tester) async {
    await tester.pumpAndSettle();

// testing  the login button
    Finder finder = await find.byType(ElevatedButton);

    expect(finder, findsOneWidget);
  });
}
