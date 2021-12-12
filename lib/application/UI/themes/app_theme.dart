import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ligth = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xFF00BD13),
      unselectedItemColor: Color(0xFF52525E),
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
  );
}
