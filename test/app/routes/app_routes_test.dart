import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppRoutes should contain correct routes', () {
    final routes = AppRoutes.routes;

    expect(routes['/'], isA<Function>());
    expect(routes['/home'], isA<Function>());
    expect(routes['/breedDetail'], isA<Function>());
    expect(routes['/favorites'], isA<Function>());
  });
}
