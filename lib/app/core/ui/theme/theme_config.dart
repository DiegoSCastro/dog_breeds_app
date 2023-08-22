import 'package:flutter/material.dart';

import '../../../app.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.i.primary,
    ),
  );
}
