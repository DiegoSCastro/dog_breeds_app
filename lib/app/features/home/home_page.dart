import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = sl<HomeCubit>();

  @override
  void initState() {
    cubit.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/favorites',
                  arguments: cubit.favoriteList,
                );
              },
              icon: Icon(
                Icons.favorite,
                color: context.color.red,
              ),
            ),
          )
        ],
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(errorMessage),
                    ElevatedButton(
                      onPressed: () => cubit.fetchData(),
                      child: const Text('Try again'),
                    )
                  ],
                ),
              ),
            HomeSuccess(:final breeds) => ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: breeds.length,
                itemBuilder: (context, index) {
                  final breed = breeds[index];
                  return BreedTile(
                    name: breed.name,
                    onTap: () => Navigator.of(context).pushNamed(
                      '/breedDetail',
                      arguments: breed,
                    ),
                    onTapFavorite: () => cubit.toggleFavorite(breed),
                    isFavorite: cubit.isFavorite(breed),
                    onHomePage: true,
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
