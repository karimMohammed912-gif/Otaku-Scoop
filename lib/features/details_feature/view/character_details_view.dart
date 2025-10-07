import 'package:flutter/material.dart';

class CharacterDetailsView extends StatelessWidget {
  final Object? data;
  const CharacterDetailsView({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    String? name;
    String? imageUrl;
    String? role;

    if (data is Map) {
      final map = data as Map;
      name = map['name'] as String?;
      imageUrl = map['image'] as String?;
      role = map['role'] as String?;
    }

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? 'Character'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 600;
          final contentPad = isWide ? 24.0 : 16.0;
          final avatarSize = isWide ? 220.0 : 160.0;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(contentPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: avatarSize,
                        height: avatarSize * 1.25,
                        color: Colors.black12,
                        child: imageUrl == null
                            ? const Icon(Icons.person, size: 48)
                            : Image.network(
                                imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 48),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    name ?? '—',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: isWide ? 24 : 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (role != null && role!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      role!,
                      style: TextStyle(
                        color: theme.colorScheme.onSurface.withOpacity(0.75),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


