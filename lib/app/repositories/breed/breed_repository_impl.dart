import 'dart:developer';

import 'package:dio/dio.dart';

import '../../app.dart';

class BreedRepositoryImpl implements BreedRepository {
  final CustomDio _dio;
  BreedRepositoryImpl({required CustomDio dio}) : _dio = dio;

  static const _breedsListUrl = 'api/breeds/list/all';

  @override
  Future<List<Breed>> getAllBreeds() async {
    try {
      final response = await _dio.get(_breedsListUrl);

      final Map<String, dynamic> jsonData = Map<String, dynamic>.from(response.data['message']);

      final List<Breed> allBreeds = jsonData.entries.map((entry) {
        final name = entry.key;
        final subBreed = List<String>.from(entry.value);
        return Breed(name: name, subBreed: subBreed);
      }).toList();

      return allBreeds;
    } on DioException catch (e, s) {
      log('error searching breeds', error: e, stackTrace: s);
      throw Exception(e.message);
    }
  }

  @override
  Future<List<String>> getBreedImageUrls({required String breed, String? subBreed}) async {
    try {
      final url =
          subBreed == null ? '/api/breed/$breed/images' : '/api/breed/$breed/$subBreed/images';
      final response = await _dio.get(url);

      return (response.data['message'] as List<dynamic>).cast<String>();
    } on DioException catch (e, s) {
      log('error searching breed images', error: e, stackTrace: s);
      throw Exception(e.message);
    }
  }
}
