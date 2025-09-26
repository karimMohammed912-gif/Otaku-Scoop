import 'package:flutter/material.dart';

class EpisodesTab extends StatelessWidget {
  final int episodes;
  final int durationMinutes;

  const EpisodesTab({super.key, required this.episodes, required this.durationMinutes});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    if (episodes <= 0) {
      return Center(
        child: Text(
          'No episodes available',
          style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7)),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: episodes,
      separatorBuilder: (_, __) => Divider(
        height: 1, 
        color: isDark ? Colors.white10 : Colors.black12
      ),
      itemBuilder: (context, index) {
        final epNumber = index + 1;
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: CircleAvatar(
            backgroundColor: isDark ? Colors.white12 : Colors.black12,
            foregroundColor: theme.colorScheme.onSurface,
            child: Text('$epNumber'),
          ),
          title: Text(
            'Episode $epNumber',
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),
          subtitle: Text(
            '$durationMinutes min',
            style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7)),
          ),
          trailing: Icon(Icons.play_arrow_rounded, color: theme.colorScheme.onSurface),
          onTap: () {
            // Integrate with parent index-based navigation if needed
          },
        );
      },
    );
  }
}
