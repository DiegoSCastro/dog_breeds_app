import 'package:flutter/material.dart';

import '../../../app.dart';
import '../../../core/ui/app_shadows.dart';

class BreedTile extends StatelessWidget {
  final String name;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;

  const BreedTile({
    super.key,
    required this.name,
    this.isFavorite = false,
    this.onTap,
    this.onTapFavorite,
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
            Text(
              name.capitalize(),
              style: context.text.titleMedium,
            ),
            IconButton(
              onPressed: onTapFavorite,
              icon: getIcon(isFavorite, context),
            ),
          ],
        ),
      ),
    );
  }

  Icon getIcon(bool isFavorite, BuildContext context) {
    return Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: isFavorite ? context.color.red : context.color.grey,
    );
  }
}
