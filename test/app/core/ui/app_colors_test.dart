import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppColors primary', () {
    final color = AppColors.i.primary;
    expect(color, equals(const Color(0xFF545ACE)));
  });

  test('AppColors grey', () {
    final color = AppColors.i.grey;
    expect(color, equals(const Color(0xFF9D9D9D)));
  });

  test('AppColors lightGrey', () {
    final color = AppColors.i.lightGrey;
    expect(color, equals(const Color(0xFFEEEEEE)));
  });

  test('AppColors white', () {
    final color = AppColors.i.white;
    expect(color, equals(const Color(0xFFFFFFFF)));
  });

  test('AppColors black', () {
    final color = AppColors.i.black;
    expect(color, equals(const Color(0xFF000000)));
  });

  test('AppColors red', () {
    final color = AppColors.i.red;
    expect(color, equals(const Color(0xFFCC0000)));
  });
}
