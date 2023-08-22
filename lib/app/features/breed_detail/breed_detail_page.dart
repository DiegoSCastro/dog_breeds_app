import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class BreedDetailPage extends StatefulWidget {
  const BreedDetailPage({super.key});

  @override
  State<BreedDetailPage> createState() => _BreedDetailPageState();
}

class _BreedDetailPageState extends State<BreedDetailPage> {
  final cubit = sl<BreedDetailCubit>();
  late final Breed _breed;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _breed = ModalRoute.of(context)?.settings.arguments as Breed;
    cubit.getBreedImageUrls(breed: _breed.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_breed.name.capitalize()),
      ),
      body: BlocBuilder<BreedDetailCubit, BreedDetailState>(
        builder: (context, state) {
          return switch (state) {
            BreedDetailInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
            BreedDetailLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            BreedDetailError(:final errorMessage) => Text(
                errorMessage,
              ),
            BreedDetailSuccess(:final imageUrls) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _breed.subBreed.map(
                        (subBreed) {
                          return InkWell(
                            onTap: () {
                              cubit.getBreedImageUrls(breed: _breed.name, subBreed: subBreed);
                            },
                            child: Text(
                              subBreed,
                              style: context.text.titleMedium,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    if (_breed.subBreed.isNotEmpty) const SizedBox(height: 24),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: imageUrls.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          final imageUrl = imageUrls[index];
                          return Image.network(
                            imageUrl,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
