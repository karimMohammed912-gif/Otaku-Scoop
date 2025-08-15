// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:otaku_scope/features/sesonal_anime/view/sesonal_anime_view.dart';
// import 'package:otaku_scope/features/top_anime/view/top_anime_view.dart';

// class PageConfig {
//   final String title;
//   final Widget Function() builder;
//   final IconData? icon;

//   const PageConfig(this.icon, {required this.title, required this.builder});
// }

// final navigationControllerProvider = StateProvider<PageConfig>((ref) {
//   return pages[0];
// });

// final pages = [
//   PageConfig(
//     Icons.star, // Add an appropriate icon
//     title: 'Top Anime',
//     builder: () => const TopAnimeView(),
//   ),
//   PageConfig(
//     Icons.calendar_today, // Add an appropriate icon
//     title: 'Seasonal Anime',
//     builder: () => const SeasonalView(),
//   ),

// ];
