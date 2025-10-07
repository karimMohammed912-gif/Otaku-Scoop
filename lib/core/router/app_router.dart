import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_scope/core/widgets/custom_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'package:otaku_scope/core/widgets/app_initializer.dart';
import 'package:otaku_scope/features/details_feature/view/details_view.dart';
import 'package:otaku_scope/features/details_feature/view/manga_details_view.dart';
import 'package:otaku_scope/features/details_feature/view/character_details_view.dart';
import 'package:otaku_scope/features/last_update_anime/view/last_update_view.dart';
import 'package:otaku_scope/features/last_update_manga/view/last_update_manga_view.dart';
import 'package:otaku_scope/features/onboardingFeature/onbarding_view.dart';
import 'package:otaku_scope/features/recommendation_anime/view/recommendation_anime_view.dart';
import 'package:otaku_scope/features/seasonal_anime/view/sesonal_anime_view.dart';
import 'package:otaku_scope/features/top_manga/view/top_manga_view.dart';
import 'package:otaku_scope/features/search/view/search_view.dart';

// Navigator keys
final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

/// The route configuration.
final GoRouter routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'Onboarding',
      path: '/onboarding',
      builder: (context, state) => const OnboardingView(),
    ),
    // Shell for main sections
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => Consumer(
        builder: (context, ref, _) {
          final themeMode = ref.watch(themeModeProvider);
          final isDark = themeMode == ThemeMode.dark;
           final isOnboardingCompleted = ref.watch(onboardingControllerProvider);
          return Scaffold(
            appBar:(!isOnboardingCompleted) ? null : AppBar(
              title: Text(state.name ?? 'Otaku Scope'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () => ref.read(themeModeProvider.notifier).toggle(),
                    borderRadius: BorderRadius.circular(20),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      transitionBuilder: (child, anim) => RotationTransition(
                        turns: Tween<double>(begin: 0.85, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                      child: Icon(
                        isDark
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode_rounded,
                        key: ValueKey(isDark),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            drawer: (!isOnboardingCompleted) ? null : const  CustomDrawer(),
            //the child is the main content of the app
            body: child,
          );
        },
      ),
      routes: [
        GoRoute(
          name: 'Home',
          path: '/',
          builder: (context, state) => const AppInitializer(),
        ),
        GoRoute(
          name: 'Seasonal Anime',
          path: '/seasonal',
          builder: (context, state) => const SeasonalView(),
        ),
        GoRoute(
          name: 'Latest Update',
          path: '/latest',
          builder: (context, state) => const LastUpdateView(),
        ),
        GoRoute(
          path: '/top-manga',
          name: 'Top Manga',
          builder: (context, state) => const TopMangaView(),
        ),
        GoRoute(
          name: 'Recommendation Anime',
          path: '/recommendation',
          builder: (context, state) => const RecommendationAnimeView(),
        ),
        GoRoute(
          name: 'Search',
          path: '/search',
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
          path: "/latest-manga",
          name: "Latest Manga",
          builder: (context, state) => const LastUpdateMangaView(),
        ),
      ],
    ),

    // Anime Details above the shell (uses root navigator)
    GoRoute(
      name: 'anime-details',
      path: '/anime/:id',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        //get the id from the path parameters
        final idParam = state.pathParameters['id'];
        final id = int.tryParse(idParam ?? '');
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 320),
          reverseTransitionDuration: const Duration(milliseconds: 280),
          child: id == null
              ? const Scaffold(
                  body: Center(
                    child: Text(
                      'Invalid id',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : AnimeDetailsView(id: id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOutCubic));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),

    // Manga Details above the shell (uses root navigator)
    GoRoute(
      name: 'manga-details',
      path: '/manga/:id',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final idParam = state.pathParameters['id'];
        final id = int.tryParse(idParam ?? '');
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 320),
          reverseTransitionDuration: const Duration(milliseconds: 280),
          child: id == null
              ? const Scaffold(
                  body: Center(
                    child: Text(
                      'Invalid id',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : MangaDetailsView(id: id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOutCubic));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),

    // Character Details (receives data via state.extra)
    GoRoute(
      name: 'character-details',
      path: '/character',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 240),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          child: CharacterDetailsView(data: state.extra),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOutCubic));
            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        );
      },
    ),
  ],
);
