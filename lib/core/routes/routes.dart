import 'package:flutter_application_1/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:flutter_application_1/features/history/presentation/screens/history_screen.dart';
import 'package:flutter_application_1/features/translation/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
  ],
);
