import 'package:flutter/material.dart';
import 'package:otaku_scope/core/widgets/shimmer_box.dart';
import 'cover_thumb.dart';
import 'stat_chip.dart';
import 'details_tab.dart';
import 'episodes_tab.dart';
import 'characters_tab.dart';

class AnimeContent extends StatelessWidget {
  final dynamic media; // details_root.Media
  const AnimeContent({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    final title = media.title?.english ?? media.title?.romaji ?? '—';
    final cover = media.coverImage?.large ?? '';
    final banner = media.bannerImage;
    final episodes = media.episodes ?? 0;
    final duration = media.duration ?? 0;
    final status = media.status ?? 'Unknown';
    final genres = (media.genres as List<String>?) ?? const <String>[];
    final score = media.averageScore ?? 0;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 600;
          final hPad = isWide ? 24.0 : 16.0;
          final vPad = isWide ? 20.0 : 12.0;
          final titleSize = isWide ? 24.0 : 20.0;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (banner != null)
                  SizedBox(
                    height: isWide ? 180 : 140,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const ShimmerBox(width: double.infinity, height: double.infinity, borderRadius: BorderRadius.zero),
                        Image.network(
                          banner,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(color: Colors.black26),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color(0x33000000),
                                Color(0x66000000),
                                Color(0x99000000),
                              ],
                              stops: [0.0, 0.3, 0.7, 1.0],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(hPad, vPad, hPad, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CoverThumb(
                            imageUrl: cover,
                            width: isWide ? 110 : 88,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSurface,
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    StatChip(icon: Icons.tv_rounded, label: '$episodes eps'),
                                    StatChip(icon: Icons.schedule_rounded, label: '${duration}m'),
                                    StatChip(icon: Icons.info_rounded, label: status.toString()),
                                    StatChip(icon: Icons.thumb_up_alt_rounded, label: '$score%'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Material(
                        color: Colors.transparent,
                        child: TabBar(
                          labelColor: Theme.of(context).colorScheme.onSurface,
                          unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          indicatorColor: Theme.of(context).colorScheme.onSurface,
                          tabs: const [
                            Tab(text: 'Details'),
                            Tab(text: 'Episodes'),
                            Tab(text: 'Characters'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 400, // Fixed height for TabBarView
                        child: TabBarView(
                          children: [
                            DetailsTab(
                              episodes: episodes,
                              durationMinutes: duration,
                              status: status,
                              genres: genres,
                              averageScore: score,
                            ),
                            EpisodesTab(
                              episodes: episodes,
                              durationMinutes: duration,
                            ),
                            CharactersTab(media: media),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
