import 'package:flutter/material.dart';

class DetailsTab extends StatelessWidget {
  final int episodes;
  final int durationMinutes;
  final String status;
  final List<String> genres;
  final int averageScore;

  const DetailsTab({
    super.key,
    required this.episodes,
    required this.durationMinutes,
    required this.status,
    required this.genres,
    required this.averageScore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurface
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        final wrapSpacing = isWide ? 10.0 : 8.0;

        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(isWide ? 8 : 4, 8, isWide ? 8 : 4, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Genres',
                style: textStyle?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: wrapSpacing,
                runSpacing: wrapSpacing,
                children: (genres.isEmpty ? ['Unknown'] : genres)
                    .map(
                      (g) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.brightness == Brightness.dark 
                              ? Colors.white12 
                              : Colors.black12,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          g,
                          style: TextStyle(color: theme.colorScheme.onSurface),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),
              Text(
                'Details',
                style: textStyle?.copyWith(fontWeight: FontWeight.w700),
              ),
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
