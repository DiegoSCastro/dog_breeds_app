import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFF545ace);
  Color get grey => const Color(0xFF9D9D9D);
  Color get lightGrey => const Color(0xFFEEEEEE);
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);
  Color get red => const Color(0xFFCC0000);
}

extension AppColorsExtensions on BuildContext {
  AppColors get color => AppColors.i;
}
