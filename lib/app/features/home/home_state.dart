part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Breed> breeds;
  final List<Breed> favorites;

  HomeSuccess({
    required this.breeds,
    required this.favorites,
  });

  HomeSuccess copyWith({
    List<Breed>? breeds,
    List<Breed>? favorites,
  }) {
    return HomeSuccess(
      breeds: breeds ?? this.breeds,
      favorites: favorites ?? this.favorites,
    );
  }
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}
