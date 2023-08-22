import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  testWidgets('ImagesGridView should display images correctly',
      (WidgetTester tester) async {
    final List<String> imageUrls = [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
      'https://example.com/image3.jpg',
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ImagesGridView(imageUrls: imageUrls),
        ),
      ),
    );

    for (final imageUrl in imageUrls) {
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CachedNetworkImage &&
              widget.imageUrl == imageUrl &&
              widget.fit == BoxFit.cover),
          findsOneWidget);
    }
  });
}
