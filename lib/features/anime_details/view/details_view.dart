import 'package:flutter/material.dart';

class AnimeDetailsView extends StatelessWidget {
  final String title;
  final String coverImage; // Small cover in header row
  final String? bannerImage; // Not used in this simplified view
  final int episodes;
  final int durationMinutes;
  final String status; // e.g., Releasing, Finished
  final List<String> genres;
  final int averageScore; // 0..100

  const AnimeDetailsView({
    super.key,
    required this.title,
    required this.coverImage,
    this.bannerImage,
    required this.episodes,
    required this.durationMinutes,
    required this.status,
    required this.genres,
    required this.averageScore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black87,
      ),
      body: DefaultTabController(
        length: 2,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Simple background gradient for readability
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0D0D0D),
                    Color(0xFF101010),
                    Color(0xFF121212),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 600;
                  final hPad = isWide ? 24.0 : 16.0;
                  final vPad = isWide ? 20.0 : 12.0;
                  final titleSize = isWide ? 24.0 : 20.0;
      
                  return Padding(
                    padding: EdgeInsets.fromLTRB(hPad, vPad, hPad, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header row: small cover + title
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _CoverThumb(
                              imageUrl: coverImage,
                              width: isWide ? 110 : 88, // takes less space
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
                                      color: Colors.white,
                                      fontSize: titleSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      _StatChip(
                                        icon: Icons.tv_rounded,
                                        label: '$episodes eps',
                                      ),
                                      _StatChip(
                                        icon: Icons.schedule_rounded,
                                        label: '${durationMinutes}m',
                                      ),
                                      _StatChip(
                                        icon: Icons.info_rounded,
                                        label: status,
                                      ),
                                      _StatChip(
                                        icon: Icons.thumb_up_alt_rounded,
                                        label: '$averageScore%',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Tabs
                        Material(
                          color: Colors.transparent,
                          child: const TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white70,
                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(text: 'Details'),
                              Tab(text: 'Episodes'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _DetailsTab(
                                episodes: episodes,
                                durationMinutes: durationMinutes,
                                status: status,
                                genres: genres,
                                averageScore: averageScore,
                              ),
                              _EpisodesTab(
                                episodes: episodes,
                                durationMinutes: durationMinutes,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoverThumb extends StatelessWidget {
  final String imageUrl;
  final double width;

  const _CoverThumb({
    required this.imageUrl,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Keep a poster-like 2:3 ratio
    final height = width * 1.5;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          // Shadowing for the cover
          BoxShadow(
            color: Colors.black54,
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.black26),
              loadingBuilder: (ctx, child, progress) {
                if (progress == null) return child;
                return Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator.adaptive(),
                );
              },
            ),
            // Gradient overlay on the cover (top->bottom) for subtle depth
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x33000000),
                    Color(0x00000000),
                    Color(0x66000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsTab extends StatelessWidget {
  final int episodes;
  final int durationMinutes;
  final String status;
  final List<String> genres;
  final int averageScore;

  const _DetailsTab({
    required this.episodes,
    required this.durationMinutes,
    required this.status,
    required this.genres,
    required this.averageScore,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        final wrapSpacing = isWide ? 10.0 : 8.0;

        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(isWide ? 8 : 4, 8, isWide ? 8 : 4, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Genres', style: textStyle?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Wrap(
                spacing: wrapSpacing,
                runSpacing: wrapSpacing,
                children: (genres.isEmpty ? ['Unknown'] : genres)
                    .map(
                      (g) => Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          g,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),
              Text('Details', style: textStyle?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(
                'Episodes: $episodes\n'
                'Duration: $durationMinutes min\n'
                'Status: $status\n'
                'Average Score: $averageScore%',
                style: textStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EpisodesTab extends StatelessWidget {
  final int episodes;
  final int durationMinutes;

  const _EpisodesTab({
    required this.episodes,
    required this.durationMinutes,
  });

  @override
  Widget build(BuildContext context) {
    if (episodes <= 0) {
      return const Center(
        child: Text('No episodes available', style: TextStyle(color: Colors.white70)),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: episodes,
      separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.white10),
      itemBuilder: (context, index) {
        final epNumber = index + 1;
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            backgroundColor: Colors.white12,
            foregroundColor: Colors.white,
            child: Text('$epNumber'),
          ),
          title: Text('Episode $epNumber', style: const TextStyle(color: Colors.white)),
          subtitle: Text(
            '$durationMinutes min',
            style: const TextStyle(color: Colors.white70),
          ),
          trailing: const Icon(Icons.play_arrow_rounded, color: Colors.white),
          onTap: () {
            // Integrate with parent index-based navigation if needed
          },
        );
      },
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}