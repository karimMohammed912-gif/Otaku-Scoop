import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'components/components.dart';
import 'package:go_router/go_router.dart';

class AnimeDetailsView extends ConsumerWidget {
  final int id;
  const AnimeDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(animeDetailsNotifierProvider(id));
    final media = state.media;
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(media?.title?.english ?? media?.title?.romaji ?? 'Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop(); // reveals the shell route without rebuilding it
            } else {
              context.go('/'); // fallback: direct entry to details
            }
          },
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark ? [
                    const Color(0xFF0D0D0D),
                    const Color(0xFF101010),
                    const Color(0xFF121212),
                  ] : [
                    const Color(0xFFF5F5F5),
                    const Color(0xFFF0F0F0),
                    const Color(0xFFEEEEEE),
                  ],
                ),
              ),
            ),
            if (state.isLoading && media == null) const LoadingSkeleton()
            else if (state.error != null) ErrorView(message: state.error!)
            else if (media == null) const ErrorView(message: 'No data found')
            else AnimeContent(media: media),
          ],
        ),
      ),
    );
  }
}

