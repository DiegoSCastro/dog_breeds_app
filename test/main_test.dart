import 'package:dog_breeds_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App initializes and starts without errors',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      const app = DogBreedsApp();
      await tester.pumpWidget(app);

      expect(tester.takeException(), isNull);
    });
  });
}
