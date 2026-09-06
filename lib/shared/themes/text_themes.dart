import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class AppTextThemes {
  // By putting the logic directly inside the getter,
  // Flutter will re-run this code every time it rebuilds.
  static TextTheme get lightTextTheme {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Inter",
        color: Colors.white, // Changed to black for light theme
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Inter",
        color: Colors.white, // Changed to black for light theme
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Inter",
        fontSize: 14,
        color: AppColors.primaryColor,
      ),
      // Add more styles here...
    );
  }
}
