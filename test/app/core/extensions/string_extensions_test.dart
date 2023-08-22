import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  test('capitalize capitalizes the first letter of each word', () {
    expect('hello world'.capitalize(), 'Hello World');
    expect('this is a test'.capitalize(), 'This Is A Test');
    expect('flutter is great'.capitalize(), 'Flutter Is Great');
  });

  test('capitalize handles empty strings', () {
    expect(''.capitalize(), '');
  });

  test('capitalize handles single-word strings', () {
    expect('flutter'.capitalize(), 'Flutter');
  });

  test('capitalize handles leading/trailing spaces', () {
    expect('  leading spaces'.capitalize(), '  Leading Spaces');
    expect('trailing spaces   '.capitalize(), 'Trailing Spaces   ');
    expect('   both leading and trailing spaces   '.capitalize(), '   Both Leading And Trailing Spaces   ');
  });
}
