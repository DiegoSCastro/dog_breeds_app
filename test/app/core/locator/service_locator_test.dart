import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomDio extends Mock implements CustomDio {}

class MockLocalStorage extends Mock implements LocalStorage {}

class MockBreedRepository extends Mock implements BreedRepository {}

void main() {
  final mockCustomDio = MockCustomDio();
  final mockLocalStorage = MockLocalStorage();
  final mockBreedRepository = MockBreedRepository();

  setUp(() {
    initTestServiceLocator(
      customDio: mockCustomDio,
      localStorage: mockLocalStorage,
      breedRepository: mockBreedRepository,
    );
  });

  test('registers services in GetIt', () {
    expect(sl<CustomDio>(), mockCustomDio);
    expect(sl<LocalStorage>(), mockLocalStorage);
    expect(sl<BreedRepository>(), mockBreedRepository);
    expect(sl<HomeCubit>(), isA<HomeCubit>());
    expect(sl<BreedDetailCubit>(), isA<BreedDetailCubit>());
  });
}

void initTestServiceLocator({
  required CustomDio customDio,
  required LocalStorage localStorage,
  required BreedRepository breedRepository,
}) {
  sl.registerLazySingleton<CustomDio>(() => customDio);
  sl.registerLazySingleton<LocalStorage>(() => localStorage);
  sl.registerLazySingleton<BreedRepository>(() => breedRepository);
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      breedRepository: sl<BreedRepository>(),
      localStorage: sl<LocalStorage>(),
    ),
  );
  sl.registerLazySingleton<BreedDetailCubit>(
    () => BreedDetailCubit(
      breedRepository: sl<BreedRepository>(),
      localStorage: sl<LocalStorage>(),
    ),
  );
}
