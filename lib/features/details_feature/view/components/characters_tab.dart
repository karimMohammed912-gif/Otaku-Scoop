import 'package:flutter/material.dart';
import 'package:otaku_scope/core/widgets/shimmer_box.dart';
import 'package:go_router/go_router.dart';

class CharactersTab extends StatelessWidget {
  final dynamic media; // details_root.Media
  const CharactersTab({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final edges = media.characters?.edges ?? const [];
    if (edges.isEmpty) {
      return Center(
        child: Text(
          'No characters', 
          style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7))
        ),
      );
    }
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        final itemWidth = isWide ? 120.0 : 96.0;
        final itemHeight = isWide ? 160.0 : 128.0;
        
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            final edge = edges[i];
            final node = edge.node;
            final name = node?.name?.full ?? '—';
            final img = node?.image?.large;
            return GestureDetector(
              onTap: () {
                final charName = node?.name?.full;
                final charImg = node?.image?.large;
                context.push('/character', extra: {
                  'name': charName,
                  'image': charImg,
                });
              },
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: itemWidth,
                    height: itemHeight,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const ShimmerBox(width: double.infinity, height: double.infinity),
                        if (img != null)
                          Image.network(
                            img, 
                            fit: BoxFit.cover, 
                            errorBuilder: (_, __, ___) => Container(color: Colors.black26)
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: itemWidth,
                  child: Text(
                    name,
                    style: TextStyle(color: theme.colorScheme.onSurface),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: edges.length,
        );
      },
    );
  }
}
