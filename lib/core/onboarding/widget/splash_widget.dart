import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/size_config/size_config.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
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
              child: Center(
                child: SizedBox(
                  width: SizeConfig.screenWidthDp! - 120,
                  height: SizeConfig().sh(100).toDouble(),
                  child: Center(
                    child: Image.asset(
                      'assets/images/bobtail.jpg',
                      width: SizeConfig.screenWidthDp! - 120,
                      height: SizeConfig().sh(100).toDouble(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
