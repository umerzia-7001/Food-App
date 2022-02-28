import 'package:flutter/material.dart';
import '../utils/colors.dart';

mixin Styles {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.blue4,
    iconTheme: const IconThemeData(color: Colors.black, size: 15),
    backgroundColor: AppColor.LM_BACKGROUND_BASIC,
    textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontFamily: "Roboto",
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.w400,
          color: AppColor.LM_BORDER_ACTIVE_BLUE6,
        ),
        bodyText2: TextStyle(
          fontFamily: "Roboto",
          fontSize: 15,
          height: 1.0,
          fontWeight: FontWeight.w400,
          color: AppColor.LM_BORDER_ACTIVE_BLUE6,
        )),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
