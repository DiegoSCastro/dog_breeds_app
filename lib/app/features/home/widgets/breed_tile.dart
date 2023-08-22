import 'package:flutter/material.dart';

import '../../../app.dart';

class BreedTile extends StatelessWidget {
  final String name;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final bool showFavoriteIcon;

  const BreedTile({
    super.key,
    required this.name,
    this.onTap,
    this.onTapFavorite,
    this.isFavorite = false,
    this.showFavoriteIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            context.shadows.cardShadow,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                name.capitalize(),
                style: context.text.titleMedium,
              ),
            ),
            Visibility(
              visible: showFavoriteIcon,
              child: IconButton(
                onPressed: onTapFavorite,
                icon: getIcon(
                  context,
                  isFavorite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Icon getIcon(BuildContext context, bool isFavorite) {
    return Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: isFavorite ? context.color.red : context.color.grey,
    );
  }
}
