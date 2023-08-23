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

  Future<void> fetchData() async => _getAllBreeds().then((_) => _loadFavorites());

  Future<void> _getAllBreeds() async {
    emit(HomeLoading());
    try {
      final response = await breedRepository.getAllBreeds();

      emit(HomeSuccess(breeds: response, favorites: const []));
    } on Exception catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      emit(HomeError(errorMessage: 'error searching breeds'));
    }
  }

  List<Breed> get favoriteList {
    if (state is HomeSuccess) {
      return (state as HomeSuccess).favorites;
    }
    return [];
  }

  void toggleFavorite(Breed breed) {
    if (state is HomeSuccess) {
      final favorites = favoriteList;
      if (favorites.contains(breed)) {
        favorites.remove(breed);
      } else {
        favorites.add(breed);
      }
      emit(
        (state as HomeSuccess).copyWith(favorites: favorites),
      );
      _saveFavorites();
    }
  }

  bool isFavorite(Breed breed) {
    return favoriteList.contains(breed);
  }

  void _saveFavorites() async {
    if (state is HomeSuccess) {
      final List<String> items = favoriteList.map((e) => jsonEncode(e.toJson())).toList();
      await localStorage.write(AppConstants.favorites, items);
    }
  }

  Future<List<Breed>> _loadFavoritesFromStorage() async {
    final storageFavorites = await localStorage.read<List<String>>(AppConstants.favorites);

    return storageFavorites?.map((item) => Breed.fromJson(jsonDecode(item))).toList() ?? [];
  }

  void _updateFavorites(List<Breed> favorites) {
    if (state is HomeSuccess) {
      emit(
        (state as HomeSuccess).copyWith(favorites: favorites),
      );
    }
  }

  void _loadFavorites() async {
    if (state is HomeSuccess) {
      final favorites = await _loadFavoritesFromStorage();
      _updateFavorites(favorites);
    }
  }
}
