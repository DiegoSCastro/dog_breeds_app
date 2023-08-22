import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../app.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedRepository breedRepository;
  final LocalStorage localStorage;
  HomeCubit({
    required this.breedRepository,
    required this.localStorage,
  }) : super(HomeInitial());

  Future<void> fetchData() async => getAllBreeds().then((_) => loadFavorites());

  Future<void> getAllBreeds() async {
    emit(HomeLoading());
    try {
      final response = await breedRepository.getAllBreeds();

      emit(HomeSuccess(breeds: response, favorites: const []));
    } on Exception catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      emit(HomeError(errorMessage: 'error searching breeds'));
    }
  }

  List<Breed> get _favorites {
    if (state is HomeSuccess) {
      return (state as HomeSuccess).favorites;
    }
    return [];
  }

  void toggleFavorite(Breed breed) {
    if (state is HomeSuccess) {
      final favorites = _favorites;
      if (favorites.contains(breed)) {
        favorites.remove(breed);
      } else {
        favorites.add(breed);
      }
      emit(
        (state as HomeSuccess).copyWith(favorites: favorites),
      );
      saveFavorites();
    }
  }

  bool isFavorite(Breed breed) {
    return _favorites.contains(breed);
  }

  void saveFavorites() async {
    if (state is HomeSuccess) {
      final List<String> items = _favorites.map((e) => jsonEncode(e.toJson())).toList();
      await localStorage.write(AppConstants.favorites, items);
    }
  }

  Future<List<Breed>> loadFavoritesFromStorage() async {
    final storageFavorites = await localStorage.read<List<String>>(AppConstants.favorites);

    return storageFavorites?.map((item) => Breed.fromJson(jsonDecode(item))).toList() ?? [];
  }

  void updateFavorites(List<Breed> favorites) {
    if (state is HomeSuccess) {
      emit(
        (state as HomeSuccess).copyWith(favorites: favorites),
      );
    }
  }

  void loadFavorites() async {
    if (state is HomeSuccess) {
      final favorites = await loadFavoritesFromStorage();
      updateFavorites(favorites);
    }
  }
}
