import 'package:flutter/material.dart';
import 'package:sport_updates/style/color.dart';
import 'package:sport_updates/style/text_style.dart';


ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: kOffBlack,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
      background: kOffBlack,
      primary: kBlack,
      secondary: kLightBlack,
      tertiary: kDarkGrey,
      shadow: kGrey.withOpacity(0.3),
      outline: kOffWhite),
  textTheme: TextTheme(
    displayLarge: largeTextStyle,
    displayMedium: mediumTextStyle,
    displaySmall: smallTextStyle,
    bodySmall: smallTextStyle.copyWith(
      color: kOffWhite.withOpacity(0.4),
    ),
  ),
);