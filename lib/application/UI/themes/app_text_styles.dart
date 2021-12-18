import 'package:flutter/cupertino.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

abstract class AppTextStyles {
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.normal,
    height: 1.25,
    letterSpacing: 0.4,
    color: Color(0xFF000000),
  );

  static const bookText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.normal,
    height: 20 / 14,
    color: Color(0xFF000000),
    letterSpacing: 0.0,
  );

  static const bookTextSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.normal,
    height: 16 / 12,
    letterSpacing: 0.4,
    color: Color(0xFF000000),
  );

  static const snackText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.normal,
    height: 16 / 12,
    letterSpacing: 0.4,
    color: Color(0xFF000000),
  );

  static const timeText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.normal,
    height: 22 / 16,
    letterSpacing: 0.0,
    color: Color(0xFF000000),
  );

  static const brakeTimeElement = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.normal,
    height: 48 / 36,
    letterSpacing: 8.0,
    color: Color(0xFF000000),
  );

  static const brakeTimeElementSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.steinback,
    fontStyle: FontStyle.normal,
    height: 20 / 12,
    letterSpacing: 2.6,
    color: Color(0xFF000000),
  );

  static const speakerName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.normal,
    height: 28 / 24,
    letterSpacing: 0.0,
    color: Color(0xFF000000),
  );

  static const bookTextItalic = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.basisGrotesquePro,
    fontStyle: FontStyle.italic,
    height: 20 / 14,
    letterSpacing: 0.0,
    color: Color(0xFF000000),
  );

  static const steinbackNormalText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.steinback,
    fontStyle: FontStyle.normal,
    height: 22 / 18,
    letterSpacing: 0.0,
    color: Color(0xFF000000),
  );

  static const steinbackText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.steinback,
    fontStyle: FontStyle.normal,
    height: 28 / 24,
    letterSpacing: 0.0,
    color: Color(0xFF000000),
  );

  static const steinbackHeadItalic = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.steinback,
    fontStyle: FontStyle.italic,
    height: 40 / 36,
    letterSpacing: 0.0,
    color: Color(0xFF000000),
  );

  static const steinbackHeadNormal = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.steinback,
    fontStyle: FontStyle.normal,
    height: 40 / 36,
    letterSpacing: 0.0,
    color: Color(0xFF000000),
  );
}
