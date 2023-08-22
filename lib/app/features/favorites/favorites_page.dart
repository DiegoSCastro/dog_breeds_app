import 'package:flutter/material.dart';

import '../../app.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final cubit = sl<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: cubit.favoriteList.length,
        itemBuilder: (context, index) {
          final favorite = cubit.favoriteList[index];
          return BreedTile(
            name: favorite.name,
            onTap: () {
              Navigator.of(context).pushNamed('/breedDetail', arguments: favorite);
            },
            onTapFavorite: () {
              cubit.toggleFavorite(favorite);
            },
            isFavorite: cubit.isFavorite(favorite),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
