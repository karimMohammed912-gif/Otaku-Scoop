import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_scope/core/widgets/custom_drawer.dart';
import 'package:otaku_scope/features/anime_details/view/details_view.dart';
import 'package:otaku_scope/features/last_update_anime/view/last_update_view.dart';
import 'package:otaku_scope/features/last_update_manga/view/last_update_manga_view.dart';
import 'package:otaku_scope/features/onbardingFeature/onbarding_view.dart';
import 'package:otaku_scope/features/recommenation_anime/view/recommendation_anime_view.dart';
import 'package:otaku_scope/features/sesonal_anime/view/sesonal_anime_view.dart';
import 'package:otaku_scope/features/top_anime/view/top_anime_view.dart';
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
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(title: Text(state.name ?? 'Otaku Scope')),
        drawer: const CustomDrawer(),
        body: child,
      ),
      routes: [
        GoRoute(
          name: 'Top Anime',
          path: '/',
          builder: (context, state) => const TopAnimeView(),
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
        GoRoute(path:"/latest-manga", name: "Latest Manga", builder: (context, state) => const LastUpdateMangaView(),),
      ],
    ),

    // Details above the shell (uses root navigator)
    GoRoute(
      name: 'details',
      path: '/details',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        // You can read data from state.extra if you pass it
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 320),
          reverseTransitionDuration: const Duration(milliseconds: 280),
          child: const AnimeDetailsView(
            title: 'Your Name',
            coverImage: 'https://picsum.photos/400/600?1',
            bannerImage: 'https://picsum.photos/1200/400?2',
            episodes: 25,
            durationMinutes: 24,
            status: 'Finished',
            genres: ['Drama', 'Romance', 'Fantasy'],
            averageScore: 92,
          ),
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
  ],
);
