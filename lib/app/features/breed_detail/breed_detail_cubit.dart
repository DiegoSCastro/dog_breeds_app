import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../app.dart';

part 'breed_detail_state.dart';

class BreedDetailCubit extends Cubit<BreedDetailState> {
  final BreedRepository breedRepository;
  final LocalStorage localStorage;
  BreedDetailCubit({
    required this.breedRepository,
    required this.localStorage,
  }) : super(BreedDetailInitial());

  Future<void> getBreedImageUrls({required String breed, String? subBreed}) async {
    emit(BreedDetailLoading());
    try {
      final response = await breedRepository.getBreedImageUrls(
        breed: breed,
        subBreed: subBreed,
      );
      saveFiveImageUrls(imageUrls: response.sublist(0, 5), breedName: breed);

      emit(BreedDetailSuccess(imageUrls: response));
    } on Exception catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      emit(BreedDetailError(errorMessage: 'Error Searching Breed Images'));
    }
  }

  void saveFiveImageUrls({
    required List<String> imageUrls,
    required breedName,
  }) async {
    final List<String> items = imageUrls;
    await localStorage.write(breedName, items);
    final savedItem = await localStorage.read<List<String>>(breedName);
    log(savedItem.toString());
  }
}
