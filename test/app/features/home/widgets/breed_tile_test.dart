import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BreedTile displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BreedTile(
            name: 'Golden Retriever',
            isFavorite: false,
            onTap: () {},
            onTapFavorite: () {},
            onHomePage: true,
          ),
        ),
      ),
    );

    expect(find.text('Golden Retriever'), findsOneWidget);

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.text('Golden Retriever'));
    await tester.pump();
  });
}
