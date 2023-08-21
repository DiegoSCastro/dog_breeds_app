import 'package:flutter/material.dart';

import '../../app.dart';

class AppShadows {
  static AppShadows? _instance;
  AppShadows._();

  static AppShadows get i {
    _instance ??= AppShadows._();
    return _instance!;
  }

  BoxShadow get cardShadow => BoxShadow(
        color: AppColors.i.black.withOpacity(0.32),
        blurRadius: 8,
        offset: const Offset(0, 4),
      );
}

extension AppShadowsExtensions on BuildContext {
  AppShadows get shadows => AppShadows.i;
}
