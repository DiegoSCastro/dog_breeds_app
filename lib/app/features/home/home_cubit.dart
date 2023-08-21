import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../app.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedRepository breedRepository;
  HomeCubit({required this.breedRepository}) : super(HomeInitial());

  Future<void> getAllBreeds() async {
    emit(HomeLoading());
    try {
      final response = await breedRepository.getAllBreeds();

      emit(HomeSuccess(breeds: response));
    } on Exception catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      emit(HomeError(errorMessage: 'error searching breeds'));
    }
  }
}
