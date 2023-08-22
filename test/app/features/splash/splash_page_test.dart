import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dog_breeds_app/app/app.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class EmptyRoute extends Route {
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Container();
  }
}

void main() {
  setUpAll(() {
    registerFallbackValue(EmptyRoute());
  });

  testWidgets('should navigate to home page after 2 seconds',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: const SplashPage(),
        onGenerateRoute: (settings) =>
            MaterialPageRoute(builder: (context) => Container()),
        navigatorObservers: [mockObserver],
      ),
    );

    await tester.pump(const Duration(seconds: 2));

    verify(() => mockObserver.didPush(captureAny(), any())).called(1);
  });
}
