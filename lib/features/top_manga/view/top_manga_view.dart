import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/utils/enums.dart';
import 'package:otaku_scope/core/widgets/custom_grid_view.dart';
import 'package:otaku_scope/core/providers/providers.dart';

class TopMangaView extends ConsumerWidget {
  const TopMangaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = TopMangaCategory.values
        .map((e) => e.name.toUpperCase())
        .toList();

    return DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          children: [
            TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
            Expanded(
              child: TabBarView(
                children: [
                  CustomGridView(
                    provider: topMangaNotifierProvider(TopMangaCategory.manga),
                    mediaType: MediaType.manga,
                  ),
                  CustomGridView(
                    provider: topMangaNotifierProvider(TopMangaCategory.novels),
                    mediaType: MediaType.manga,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
