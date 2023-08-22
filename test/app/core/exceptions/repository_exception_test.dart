import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  test('RepositoryException should have the correct message', () {
    final exception = RepositoryException(message: 'This is an error message');
    expect(exception.message, 'This is an error message');
  });

  test('RepositoryException should throw with the correct message', () {
    try {
      throw RepositoryException(message: 'This is another error message');
    } catch (e) {
      expect(e, isA<RepositoryException>());
      expect((e as RepositoryException).message, 'This is another error message');
    }
  });
}
