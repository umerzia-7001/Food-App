import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/config/network/network_config.dart';
import 'package:food_app/core/auth/presentation/login_screen.dart';
import 'package:food_app/core/auth/provider/auth_providers.dart';
import 'package:food_app/core/onboarding/splash_screen.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock implements Dio {}

void main() {
  Widget makeTestableWidget({required Widget child, required Auth auth}) {
    return EmailAuthScreen();
  }

  testWidgets('finds exactly one widget', (WidgetTester tester) async {
    await tester.pumpAndSettle();
    await tester.pumpWidget(SplashScreen());

    Finder finder = await find.byType(SplashScreen);
    expect(finder, findsOneWidget);
  });

  testWidgets(
      'non-empty email and password, valid account, call sign in, succeed',
      (WidgetTester tester) async {
    setUp() {
      final Dio dio = NetworkConfig().dio;
    }

    Auth mockAuth = Auth(tokens: '', userId: '');
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          when(mockAuth.emailLogin(context, 'email', 'password'))
              .thenAnswer((invocation) => Future.value('uid'));
          return Container();
        },
      ),
    );

    bool didSignIn = false;
    EmailAuthScreen page = EmailAuthScreen();

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'umer@gmail.com');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'umer1234');

    await tester.tap(find.byKey(Key('login')));
    Builder(
      builder: (BuildContext context) {
        verify(mockAuth.emailLogin(context, 'email', 'password')).called(1);
        expect(didSignIn, true);
        return Container();
      },
    );
  });
}
