import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static EdgeInsets popupPadding = const EdgeInsets.all(16);
  static double popupFontSize = 14;

  static ThemeData lightThemeData = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    cardColor: AppColors.white,
    appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: AppColors.mainGreen2),
        textTheme: TextTheme(
          headline6: ComponentWise().appTitle(AppColors.white),
          // TextStyle(
          //     fontSize: 17.5, height: 21 / 17.5, color: Color(0xffBFBFBF))
        )),
  );

  // For future use -- (This is dummy data.)
  static ThemeData darkThemeData = ThemeData(
      fontFamily: 'Roboto',
      brightness: Brightness.dark,
      primaryColor: Color(0xffFA8345),
      accentColor: Color(0xffFA8345),
      highlightColor: Color(0xffBFBFBF),
      backgroundColor: Color(0xff1C1C1E),
      scaffoldBackgroundColor: Color(0xff1C1C1E),
      canvasColor: Colors.black,
      splashColor: Color(0xffffffff),
      iconTheme: IconThemeData(color: Color(0xffBFBFBF)),
      cardColor: Color(0xff333333),
      appBarTheme: AppBarTheme(
          color: Color(0xff333333),
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Color(0xffBFBFBF)),
          textTheme: TextTheme(
              headline6: TextStyle(
                  fontSize: 17.5,
                  height: 21 / 17.5,
                  color: Color(0xffBFBFBF)))),
      primaryTextTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 32,
              height: 1.25,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.15,
              color: Color(0xffFFFFFF)),
          headline2: TextStyle(color: Color(0xffBFBFBF)),
          headline6: TextStyle(color: Color(0xffBFBFBF)),
          subtitle1: TextStyle(color: Color(0xffBFBFBF)),
          headline3: TextStyle(color: Color(0xff737373))),
      dividerTheme: DividerThemeData(color: Color(0xff666666), thickness: 0.5),
      sliderTheme: SliderThemeData(
          trackHeight: 1,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 15)));
}
