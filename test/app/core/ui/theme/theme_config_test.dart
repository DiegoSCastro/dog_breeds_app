import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ThemeConfig returns the correct theme', () {
    final theme = ThemeConfig.theme;

    expect(theme.useMaterial3, isTrue);
  });
}
