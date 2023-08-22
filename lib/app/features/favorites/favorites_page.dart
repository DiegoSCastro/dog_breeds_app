import 'package:flutter/material.dart';

import '../../app.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final List<Breed> favoriteList;

  @override
  void didChangeDependencies() {
    favoriteList = ModalRoute.of(context)?.settings.arguments as List<Breed>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          final favorite = favoriteList[index];
          return BreedTile(
            name: favorite.name,
            onTap: () {
              Navigator.of(context).pushNamed(
                '/breedDetail',
                arguments: favorite,
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
