import 'package:flutter/material.dart';
import 'package:test_questionaire/shared/colors/colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryOrange,
  dividerColor: AppColors.primaryGrey,
  useMaterial3: true,
  fontFamily: "ProximaSoft",
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryGrey,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryOrange,
    ),
  ),
);
