import '../../app.dart';

abstract interface class BreedRepository {
  Future<List<Breed>> getAllBreeds();
  Future<List<String>> getBreedImageUrls({required String breed, String? subBreed});
}
