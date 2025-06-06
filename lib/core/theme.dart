import 'package:digi_patient/core/sizes.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      // scaffoldBackgroundColor: AppColors.lightBg,
      scaffoldBackgroundColor: Colors.transparent,
      fontFamily: 'OpenSans',
      colorScheme: ColorScheme.fromSeed(
        primary: AppColors.primary,
        seedColor: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        surface: AppColors.lightBg,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.titleBold,
        titleMedium: AppTextStyles.subtitle,
        bodyMedium: AppTextStyles.body,
        labelLarge: AppTextStyles.button,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBg,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.lightText),
        titleTextStyle: TextStyle(color: AppColors.lightText, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusSmall)),
        )
      )
    );
  }
}