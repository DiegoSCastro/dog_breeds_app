import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesListRow extends StatelessWidget {
  final List<String> imageUrls;
  const ImagesListRow({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: imageUrls
          .map(
            (image) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: image,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                        '/full_screen',
                        arguments: image,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
