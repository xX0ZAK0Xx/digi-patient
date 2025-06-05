import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  // Light
  static const TextStyle title = TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.lightText);
  static const TextStyle subtitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.lightText);
  static const TextStyle body = TextStyle(fontSize: 14, color: AppColors.lightText);
  static const TextStyle button = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.lightText);

  // Dark
  static const TextStyle titleDark = TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.darkText);
  static const TextStyle subtitleDark = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.darkText);
  static const TextStyle bodyDark = TextStyle(fontSize: 14, color: AppColors.darkText);
  static const TextStyle buttonDark = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.darkText);
}
