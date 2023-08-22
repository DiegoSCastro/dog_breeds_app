import 'package:dio/dio.dart';
import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomDio extends Mock implements CustomDio {}

void main() {
  late BreedRepositoryImpl breedRepository;
  late MockCustomDio mockDio;

  setUp(() {
    mockDio = MockCustomDio();
    breedRepository = BreedRepositoryImpl(dio: mockDio);
  });

  group('getAllBreeds', () {
    test('should return a list of breeds when successful', () async {
      final responseMap = {
        'message': {
          'breed1': [],
          'breed2': ['subBreed1', 'subBreed2'],
        },
      };

      when(() => mockDio.get(any())).thenAnswer((_) async =>
          Response(data: responseMap, requestOptions: RequestOptions()));

      final breeds = await breedRepository.getAllBreeds();

      expect(breeds, isA<List<Breed>>());
      expect(breeds.length, equals(2));
    });

    test('should throw an exception when DioException occurs', () async {
      when(() => mockDio.get(any())).thenThrow(DioException(
          response:
              Response(data: 'Error message', requestOptions: RequestOptions()),
          requestOptions: RequestOptions()));

      expect(() async => await breedRepository.getAllBreeds(),
          throwsA(isA<Exception>()));
    });
  });

  group('getBreedImageUrls', () {
    test('should return a list of image URLs when successful', () async {
      final responseMap = {
        'message': ['url1', 'url2', 'url3'],
      };

      when(() => mockDio.get(any())).thenAnswer((_) async =>
          Response(data: responseMap, requestOptions: RequestOptions()));

      final imageUrls =
          await breedRepository.getBreedImageUrls(breed: 'breedName');

      expect(imageUrls, isA<List<String>>());
      expect(imageUrls.length, equals(3));
    });

    test('should throw an exception when DioException occurs', () async {
      when(() => mockDio.get(any())).thenThrow(DioException(
          response:
              Response(data: 'Error message', requestOptions: RequestOptions()),
          requestOptions: RequestOptions()));

      expect(
          () async =>
              await breedRepository.getBreedImageUrls(breed: 'breedName'),
          throwsA(isA<Exception>()));
    });
  });
}
