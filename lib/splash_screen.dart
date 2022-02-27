import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/size_config/size_config.dart';

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

    Future.delayed(const Duration(seconds: 3), () async {});
  }

  @override
  Widget build(BuildContext context) {
    return const SplashWidget();
  }
}

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  static const routeName = '/splash';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeightDp,
        width: SizeConfig.screenWidthDp,
        color: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: SizeConfig.screenHeightDp,
              width: SizeConfig.screenWidthDp,
              child: Center(),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 50,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
