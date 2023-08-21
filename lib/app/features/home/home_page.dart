import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = sl<HomeCubit>();

  @override
  void initState() {
    cubit.getAllBreeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
            HomeLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            HomeError(:final errorMessage) => Center(
                child: Text(errorMessage),
              ),
            HomeSuccess(:final breeds) => ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: breeds.length,
                itemBuilder: (context, index) {
                  final breed = breeds[index];
                  return BreedTile(
                    name: breed.name,
                    onTap: () {},
                    onTapFavorite: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
              ),
          };
        },
      ),
    );
  }
}
