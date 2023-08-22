import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Breed', () {
    test('should create Breed instance with default values', () {
      const breed = Breed();

      expect(breed, isA<Breed>());
      expect(breed.name, '');
      expect(breed.subBreed, []);
    });

    test('should create Breed instance with provided values', () {
      const breed = Breed(name: 'BreedName', subBreed: ['SubBreed1', 'SubBreed2']);

      expect(breed, isA<Breed>());
      expect(breed.name, 'BreedName');
      expect(breed.subBreed, ['SubBreed1', 'SubBreed2']);
    });

    test('fromJson should create Breed instance from JSON map', () {
      final jsonMap = {'name': 'BreedName', 'subBreed': ['SubBreed1', 'SubBreed2']};
      final breed = Breed.fromJson(jsonMap);

      expect(breed, isA<Breed>());
      expect(breed.name, 'BreedName');
      expect(breed.subBreed, ['SubBreed1', 'SubBreed2']);
    });
  });
}
