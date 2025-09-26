import 'package:flutter/material.dart';

class MangaChaptersTab extends StatelessWidget {
  final int chapters;
  final int volumes;

  const MangaChaptersTab({
    super.key, 
    required this.chapters, 
    required this.volumes
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    if (chapters <= 0) {
      return Center(
        child: Text(
          'No chapters available',
          style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7)),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      itemCount: chapters,
      separatorBuilder: (_, __) => Divider(
        height: 1, 
        color: isDark ? Colors.white10 : Colors.black12
      ),
      itemBuilder: (context, index) {
        final chapterNumber = index + 1;
        final volumeNumber = volumes > 0 ? ((index / (chapters / volumes)).ceil()) : null;
        
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: CircleAvatar(
            backgroundColor: isDark ? Colors.white12 : Colors.black12,
            foregroundColor: theme.colorScheme.onSurface,
            child: Text('$chapterNumber'),
          ),
          title: Text(
            'Chapter $chapterNumber',
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),
          subtitle: Text(
            volumeNumber != null ? 'Volume $volumeNumber' : 'Chapter $chapterNumber',
            style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7)),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded, color: theme.colorScheme.onSurface),
          onTap: () {
            // Handle chapter tap - could navigate to chapter reader
          },
        );
      },
    );
  }
}
