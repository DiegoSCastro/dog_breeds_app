import '../app.dart';

sealed class AppRoutes {
  static final routes = {
    '/': (_) => const SplashPage(),
    '/home': (_) => const HomePage(),
    '/breedDetail': (_) => const BreedDetailPage(),
    '/favorites': (_) => const FavoritesPage(),
  };
}
