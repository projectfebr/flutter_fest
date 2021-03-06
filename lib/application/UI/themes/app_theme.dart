import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';

abstract class AppTheme {
  static final ligth = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.darkBackground,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.darkText,
    ),
  );
}
