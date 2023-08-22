import 'package:get_it/get_it.dart';

import '../../app.dart';
import '../../features/home/home_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton<CustomDio>(() => CustomDio());
  sl.registerLazySingleton<BreedRepository>(
    () => BreedRepositoryImpl(
      dio: sl<CustomDio>(),
    ),
  );
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      breedRepository: sl<BreedRepository>(),
    ),
  );
  sl.registerLazySingleton<BreedDetailCubit>(
    () => BreedDetailCubit(
      breedRepository: sl<BreedRepository>(),
    ),
  );
}
