import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemesData {
  static ThemeData getLightTheme() {
    return ThemeData.light().copyWith(
        primaryColor: AppColors.LIGHT_Red,
        accentColor: AppColors.yellow,
        buttonColor: AppColors.yellow,
        disabledColor: Colors.grey,
        cardColor: AppColors.cardColor,
        indicatorColor: AppColors.yellow,
        primaryColorLight: AppColors.purple,
        primaryColorDark: AppColors.purple,
        scaffoldBackgroundColor: Colors.grey.shade100,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.purple,
        ),
        colorScheme: ColorScheme.light().copyWith(
            secondary: AppColors.yellow,
            secondaryVariant: AppColors.darkYellow,
            surface: AppColors.cardColor),
        // // splashColor: AppColors.purple.withOpacity(0.5),
        // highlightColor: AppColors.purple.withOpacity(0.2),
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'sst-arabic'),
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary, disabledColor: Colors.grey));
  }
}

// ColorScheme(
// primary: AppColors.purple,
// primaryVariant: AppColors.darkPurple,
// secondary: AppColors.cardYellow,
// secondaryVariant: AppColors.darkYellow,
// surface: AppColors.cardBlue,
// background: AppColors.scaffoldBackground,
// error: Colors.redAccent,
// onPrimary: Colors.white,
// onSecondary: Colors.white,
// onSurface: Colors.black,
// onBackground: Colors.black,
// onError: Colors.white,
// brightness: Brightness.light,
// ),
