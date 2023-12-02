import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  static TextStyle title = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle subtitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle body = const TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );

  static TextStyle bodyBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
}
