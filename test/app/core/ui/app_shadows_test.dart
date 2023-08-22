import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppShadows cardShadow', () {
    final shadow = AppShadows.i.cardShadow;

    expect(shadow.color, equals(AppColors.i.black.withOpacity(0.32)));
    expect(shadow.blurRadius, equals(8));
    expect(shadow.offset, equals(const Offset(0, 4)));
  });
}
