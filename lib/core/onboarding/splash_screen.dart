import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/core/auth/presentation/login_screen.dart';
import 'package:food_app/core/menu/presentation/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widget/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      startNavigation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashWidget();
  }

  Future<void> startNavigation() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString("authToken");

    if (token == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => EmailAuthScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }
}
