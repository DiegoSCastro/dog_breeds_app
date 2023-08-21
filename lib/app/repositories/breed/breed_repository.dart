import '../../app.dart';

abstract interface class BreedRepository {
  Future<List<Breed>> getAllBreeds();
}
