import 'dart:developer';

import 'package:flutter/material.dart';

import '../../app.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final List<Breed> favoriteList;
  final localStorage = sl<LocalStorage>();
  Map favoriteMap = {};

  @override
  void didChangeDependencies() async {
    favoriteList = ModalRoute.of(context)?.settings.arguments as List<Breed>;
    await getImagesFromStorage();
    super.didChangeDependencies();
  }

  Future<void> getImagesFromStorage() async {
    for (final favorite in favoriteList) {
      final breedImageUrls = await localStorage.read<List<String>>(favorite.name);
      favoriteMap.addAll({favorite: breedImageUrls});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Visibility(
        visible: favoriteList.isNotEmpty,
        replacement: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Favorites list is empty,\n tap ♥ and add some',
              style: context.text.titleMedium,
            ),
          ),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(24),
          itemCount: favoriteList.length,
          itemBuilder: (context, index) {
            final favorite = favoriteList[index];

            return BreedTile(
              name: favorite.name,
              imageUrls: favoriteMap[favorite] ?? [],
              onTap: () {
                Navigator.of(context)
                    .pushNamed(
                  '/breedDetail',
                  arguments: favorite,
                )
                    .then((value) async {
                  await getImagesFromStorage();
                });
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}
