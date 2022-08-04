import 'package:flutter/material.dart';

class AppColors {
  static const Color lightGreen = Color(0xFF45E3D5);
  static Color tfBorder = const Color(0xFFCAE6FD);
  static Color grey = const Color(0xFF787878);
  static Color black = const Color(0xFF383838);
  static Color white = const Color(0xFFFFFFFF);

  static Color lightBlue = const Color(0xFFCAE6FD);
  static Color bgColor = const Color(0xFFF9FCFF);
  static Color graphBg = const Color(0xFFEBF6FF);
  static Color dialogColor = white;
  static Color textColor = const Color(0xFF383838);
  static Color greyTextColor = const Color(0xFF656565);
  static Color g2Color = const Color(0xFF00CAE8);
  static Color g3Color = const Color(0xFF00ACF1);
  static Color g4Color = const Color(0xFF4689E4);
  static Color g5Color = const Color(0xFF8760BD);
  static Color g6Color = const Color(0xFFA22F80);
  static Color iconBgColor = const Color(0xFFA9D9FF);
  static Color shadowColor = const Color(0xFF005190);
  static Color onlineColor = const Color(0xFF65E345);
  static Color oflineColor = const Color(0xFFBDBDBD);
  static Color messageBg = const Color(0xFFE8F5FF);
  static Color red = const Color(0xFFD62D30);
  static Color orange = const Color(0xFFF8981D);
  static Color barColor = iconBgColor;
  static Color monthsBg = white;
  static const Color theme = Color(0xFFf58433);
  static const Color text = Colors.black;
  // static Color itemDetailBg = Color(0xFFC4C4C4);
  // if app has a dark mood
  // static setThemeColor(bool isDark) {
  //   // print("isdark ......$isDark");
  //   bgColor = isDark ? const Color(0xFF1E2429) : const Color(0xFFF9FCFF);
  //   textColor = isDark ? white : const Color(0xFF383838);
  //   dialogColor = isDark ? const Color(0xFF2F353A) : white;
  //   iconBgColor = isDark ? dialogColor : const Color(0xFFA9D9FF);
  //   greyTextColor = isDark ? white : const Color(0xFF656565);
  //   shadowColor = isDark ? const Color(0xFF252C32) : const Color(0xFF005190);
  //   messageBg = isDark ? const Color(0xFF2F353A) : const Color(0xFFE8F5FF);
  //   graphBg = isDark ? const Color(0xFF2D3338) : const Color(0xFFEBF6FF);
  //   barColor = isDark ? const Color(0xFF434A50) : const Color(0xFFA9D9FF);
  //   monthsBg = isDark ? const Color(0xFF434A50) : white;
  //   // itemDetailBg = isDark ? Color(0xFF2D3338) : Color(0xFFF9FCFF);
  // }
}

class Palette {
  static const MaterialColor color = MaterialColor(
    0xFFf58433, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFf58433), //10%
      100: Color(0xFFf58433), //20%
      200: Color(0xFFf58433), //30%
      300: Color(0xFFf58433), //40%
      400: Color(0xFFf58433), //50%
      500: Color(0xFFf58433), //60%
      600: Color(0xFFf58433), //70%
      700: Color(0xFFf58433), //80%
      800: Color(0xFFf58433), //90%
      900: Color(0xFFf58433), //100%
    },
  );
}
