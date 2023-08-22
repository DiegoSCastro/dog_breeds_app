part of 'breed_detail_cubit.dart';

@immutable
sealed class BreedDetailState {}

final class BreedDetailInitial extends BreedDetailState {}

final class BreedDetailLoading extends BreedDetailState {}

final class BreedDetailSuccess extends BreedDetailState {
  final List<String> imageUrls;

  BreedDetailSuccess({required this.imageUrls});
}

final class BreedDetailError extends BreedDetailState {
  final String errorMessage;

  BreedDetailError({required this.errorMessage});
}
