import '../app.dart';
import '../features/full_screen/full_screen_page.dart';

sealed class AppRoutes {
  static final routes = {
    '/': (_) => const SplashPage(),
    '/home': (_) => const HomePage(),
    '/breedDetail': (_) => const BreedDetailPage(),
    '/favorites': (_) => const FavoritesPage(),
    '/full_screen': (_) => const FullScreenPage(),
  };
}
