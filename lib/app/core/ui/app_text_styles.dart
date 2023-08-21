import 'package:flutter/material.dart';

class AppTextStyles {
  static AppTextStyles? _instance;
  AppTextStyles._();

  static AppTextStyles get i {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get displayLarge => const TextStyle(
        fontSize: 57,
        height: 1.12,
        letterSpacing: -0.25,
        fontWeight: FontWeight.w400,
      );
  TextStyle get displayMedium => const TextStyle(
        fontSize: 45,
        height: 1.16,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle get displaySmall => const TextStyle(
        fontSize: 36,
        height: 1.22,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle get headlineLarge => const TextStyle(
        fontSize: 32,
        height: 1.25,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle get headlineMedium => const TextStyle(
        fontSize: 28,
        height: 1.29,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle get headlineSmall => const TextStyle(
        fontSize: 24,
        height: 1.33,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle get titleLarge => const TextStyle(
        fontSize: 22,
        height: 1.27,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w500,
      );
  TextStyle get titleSmall => const TextStyle(
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w500,
      );
  TextStyle get labelLarge => const TextStyle(
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w500,
      );
  TextStyle get labelMedium => const TextStyle(
        fontSize: 12,
        height: 1.33,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
      );
  TextStyle get labelSmall => const TextStyle(
        fontSize: 11,
        height: 1.45,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
      );
  TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400,
      );
  TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400,
      );
  TextStyle get bodySmall => const TextStyle(
        fontSize: 12,
        height: 1.33,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400,
      );
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get text => AppTextStyles.i;
}
