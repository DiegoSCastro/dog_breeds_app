import 'package:flutter/material.dart';

class AppTextStyles {
  static AppTextStyles? _instance;
  AppTextStyles._();

  static AppTextStyles get i {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get displaySmall => const TextStyle(
        fontSize: 36,
        height: 1.22,
        letterSpacing: 0.0,
        fontWeight: FontWeight.w400,
      );

  TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w500,
      );
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get text => AppTextStyles.i;
}
