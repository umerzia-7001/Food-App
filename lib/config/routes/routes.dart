import 'package:flutter/material.dart';
import 'package:food_app/core/menu/presentation/home_screen.dart';

import '../../core/onboarding/splash_screen.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //when login successfull
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      default:
        return _errorRoute();
    }
  }

// Error page displayed if no route found
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text('No route defined')),
      );
    });
  }
}
