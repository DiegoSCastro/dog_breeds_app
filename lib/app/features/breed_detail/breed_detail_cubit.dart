import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../app.dart';

part 'breed_detail_state.dart';

class BreedDetailCubit extends Cubit<BreedDetailState> {
  final BreedRepository breedRepository;
  BreedDetailCubit({required this.breedRepository}) : super(BreedDetailInitial());

  Future<void> getBreedImageUrls({required String breed, String? subBreed}) async {
    emit(BreedDetailLoading());
    try {
      final response = await breedRepository.getBreedImageUrls(
        breed: breed,
        subBreed: subBreed,
      );

      emit(BreedDetailSuccess(imageUrls: response));
    } on Exception catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      emit(BreedDetailError(errorMessage: 'Error Searching Breed Images'));
    }
  }
}
