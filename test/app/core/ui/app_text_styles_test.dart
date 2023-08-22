import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppTextStyles displaySmall style', () {
    final style = AppTextStyles.i.displaySmall;

    expect(style.fontSize, 36);
    expect(style.height, 1.22);
    expect(style.letterSpacing, 0.0);
    expect(style.fontWeight, FontWeight.w400);
  });

  test('AppTextStyles titleMedium style', () {
    final style = AppTextStyles.i.titleMedium;

    expect(style.fontSize, 16);
    expect(style.height, 1.5);
    expect(style.letterSpacing, 0.15);
    expect(style.fontWeight, FontWeight.w500);
  });
}
