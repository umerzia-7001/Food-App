import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/auth/presentation/login_screen.dart';

void main() {
  Widget makeTestableWidget() {
    return EmailAuthScreen();
  }

  testWidgets('finds exactly one widget', (WidgetTester tester) async {
    await tester.pumpAndSettle();
    await tester.pumpWidget(makeTestableWidget());
    // Setting widgets

    // checking auth : entering email password and checking logging button
    Finder emailField = find.byKey(Key('email'));

    await tester.enterText(emailField, 'umer@gmail.com');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'umer1234');

    await tester.tap(find.byKey(Key('login')));
  });
}
