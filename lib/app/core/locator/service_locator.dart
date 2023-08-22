import 'package:get_it/get_it.dart';

import '../../app.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton<CustomDio>(() => CustomDio());
  sl.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());
  sl.registerLazySingleton<BreedRepository>(
    () => BreedRepositoryImpl(
      dio: sl<CustomDio>(),
    ),
  );
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      breedRepository: sl<BreedRepository>(),
      localStorage: sl<LocalStorage>(),
    ),
  );
  sl.registerLazySingleton<BreedDetailCubit>(
    () => BreedDetailCubit(
      breedRepository: sl<BreedRepository>(),
    ),
  );
}
