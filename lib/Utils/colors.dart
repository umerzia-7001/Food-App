import 'package:flutter/material.dart';

mixin AppColor {
  static const Color pendingColor = Color.fromRGBO(250, 184, 76, 1);
  static const Color acceptedColor = Color.fromRGBO(61, 199, 159, 1);
  static const Color readyColor = Color.fromRGBO(0, 190, 214, 1);
  static const Color pickedUpColor = Color.fromRGBO(59, 137, 236, 1);
  static const Color notPickedUpColor = Colors.black;
  static const Color rejectedColor = Color.fromRGBO(239, 103, 107, 1);

  //Blues
  static const Color blue1 = Color.fromRGBO(229, 247, 251, 1);
  static const Color blue3 = Color.fromRGBO(153, 229, 239, 1);
  static const Color blue4 = Color.fromRGBO(102, 216, 230, 1);
  static const Color blue10 = Color.fromRGBO(0, 48, 54, 1);

  //Reds
  static const Color red1 = Color.fromRGBO(253, 240, 240, 1);
  static const Color red7 = Color.fromRGBO(191, 82, 86, 1);
  static const Color red9 = Color.fromRGBO(96, 41, 43, 1);
  static const Color red10 = Color.fromRGBO(60, 26, 27, 1);

  //Greens
  static const Color green1 = Color.fromRGBO(236, 249, 245, 1);
  static const Color green2 = Color.fromRGBO(206, 241, 231, 1);
  static const Color green7 = Color.fromRGBO(49, 159, 127, 1);
  static const Color green8 = Color.fromRGBO(37, 119, 95, 1);
  static const Color green10 = Color.fromRGBO(15, 50, 40, 1);

  //Yellows
  static const Color yellow1 = Color.fromRGBO(255, 248, 237, 1);
  static const Color yellow6 = Color.fromRGBO(250, 184, 76, 1);
  static const Color yellow10 = Color.fromRGBO(100, 74, 30, 1);

  //InfoBlue
  static const Color infoBlue1 = Color.fromRGBO(226, 237, 252, 1);
  static const Color infoBlue5 = Color.fromRGBO(88, 154, 239, 1);
  static const Color infoBlue9 = Color.fromRGBO(24, 55, 94, 1);
  static const Color infoBlue10 = Color.fromRGBO(15, 34, 59, 1);

  //Greys
  static const Color grey1 = Color.fromRGBO(255, 255, 255, 1);
  static const Color grey2 = Color.fromRGBO(249, 249, 249, 1);
  static const Color grey3 = Color.fromRGBO(240, 240, 240, 1);
  static const Color grey4 = Color.fromRGBO(233, 233, 233, 1);
  static const Color grey5 = Color.fromRGBO(223, 222, 223, 1);
  static const Color grey6 = Color.fromRGBO(157, 157, 157, 1);
  static const Color grey7 = Color.fromRGBO(125, 124, 125, 1);
  static const Color grey8 = Color.fromRGBO(92, 92, 92, 1);
  static const Color grey9 = Color.fromRGBO(38, 37, 38, 1);
  static const Color grey10 = Color.fromRGBO(0, 0, 0, 1);

  // ----------------------- Design Tokens  -----------------------

  //Background
  static const Color LM_BACKGROUND_GREY1 = Color.fromRGBO(255, 255, 255, 1);
  static const Color LM_BACKGROUND_GREY2 = Color.fromRGBO(249, 249, 249, 1);
  static const Color LM_BACKGROUND_BASIC = Color.fromRGBO(249, 249, 249, 1);
  static const Color LM_BACKGROUND_GREY3 = Color.fromRGBO(240, 240, 240, 1);
  static const Color LM_BACKGROUND_GREY4 = Color.fromRGBO(233, 233, 233, 1);

  //Drop-Shadow
  static const Color LM_SHADOW_GREY10_5 = Color.fromRGBO(0, 0, 0, 0.05);
  static const Color LM_SHADOW_GREY10_10 = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color LM_SHADOW_GREY10_20 = Color.fromRGBO(0, 0, 0, 0.2);
  static const Color LM_SHADOW_GREY10_30 = Color.fromRGBO(0, 0, 0, 0.3);

  //Overlay
  static const Color LM_OVERLAY_GREY10_30 = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color LM_OVERLAY_GREY10_60 = Color.fromRGBO(0, 0, 0, 0.6);

  //Card Base
  static const Color LM_CARDBASE_GREY1 = Color.fromRGBO(255, 255, 255, 1);
  static const Color LM_CARDBASE_SUCCESS_GREEN6 =
      Color.fromRGBO(61, 199, 159, 1);
  static const Color LM_CARDBASE_INFO_BLUE = Color.fromRGBO(59, 137, 236, 1);

  //Font
  static const Color LM_FONT_PRIMARY_GREY10 = Color.fromRGBO(38, 37, 38, 1);
  static const Color LM_FONT_SECONDARY_GREY8 = Color.fromRGBO(92, 92, 92, 1);
  static const Color LM_FONT_DISABLE_GREY5 = Color.fromRGBO(223, 222, 223, 1);
  static const Color LM_FONT_BLOCKTEXT_GREY7 = Color.fromRGBO(125, 124, 125, 1);
  static const Color LM_FONT_NORMAL_GREY1 = Color.fromRGBO(255, 255, 255, 1);
  static const Color LM_FONT_ERROR_RED6 = Color.fromRGBO(239, 103, 107, 1);
  static const Color LM_FONT_WARNING_YELLOW6 = Color.fromRGBO(250, 184, 76, 1);
  static const Color LM_FONT_SUCCESS_GREEN6 = Color.fromRGBO(61, 199, 159, 1);
  static const Color LM_FONT_DISABLE_GREY1_50 =
      Color.fromRGBO(255, 255, 255, 0.5);
  static const Color LM_FONT_INF0_BLUE6 = Color.fromRGBO(59, 137, 236, 1);
  static const Color LM_FONT_PRIMARY_GREY6 = Color.fromRGBO(64, 64, 65, 1);
  static const Color LM_FONT_PRIMARY_GREY9 = Color.fromRGBO(38, 37, 38, 1);

  //Button
  static const Color LM_BUTTON_NORMAL_BLUE_6 = Color.fromRGBO(114, 204, 217, 1);
  static const Color LM_BUTTON_WARNING_YELLLOW6 =
      Color.fromRGBO(250, 184, 76, 1);
  static const Color LM_BUTTON_SUCCESS_GREEN6 = Color.fromRGBO(61, 199, 159, 1);
  static const Color LM_BUTTON_ERROR_RED6 = Color.fromRGBO(239, 103, 107, 1);
  static const Color LM_BUTTON_DISABLE_GREY5 = Color.fromRGBO(223, 222, 223, 1);
  static const Color LM_BUTTON_NORMAL_GREY9 = Color.fromRGBO(38, 37, 38, 1);
  static const Color LM_BUTTON_DISABLE_BLUE7 =
      Color.fromRGBO(114, 204, 217, 0.4);

  //Separator
  static const Color LM_SEPARATOR_GREY4 = Color.fromRGBO(233, 233, 233, 1);
  static const Color LM_SEPARATOR_GREY6 = Color.fromRGBO(157, 157, 157, 1);

  //Border
  static const Color LM_BORDER_ACTIVE_BLUE6 = Color.fromRGBO(0, 190, 214, 1);
  static const Color LM_BORDER_ERROR_RED6 = Color.fromRGBO(239, 103, 107, 1);
  static const Color LM_BORDER_WARNING_YELLOW6 =
      Color.fromRGBO(250, 184, 76, 1);
  static const Color LM_BORDER_NORMAL_GREY7 = Color.fromRGBO(125, 124, 125, 1);
  static const Color LM_BORDER_NORMAL_GREY1 = Color.fromRGBO(255, 255, 255, 1);
  static const Color LM_BORDER_INFO_BLUE6 = Color.fromRGBO(59, 137, 236, 1);
  static const Color LM_ORDER_INACTIVE_GREY4 = Color.fromRGBO(233, 233, 233, 1);

  //UI
  static const Color UI_GREY = Color.fromRGBO(150, 159, 164, 1);
}
