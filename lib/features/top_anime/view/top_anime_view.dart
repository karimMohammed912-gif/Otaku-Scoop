import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/widgets/custom_grid_view.dart';
import 'package:otaku_scope/core/providers/providers.dart';

class TopAnimeView extends ConsumerWidget {
  const TopAnimeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
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
                  CustomGridView(provider: topAnimeNotifierProvider) ,
                  CustomGridView(provider: topAnimeNotifierProvider ),
                  CustomGridView(provider: topAnimeNotifierProvider),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final tabs = [' Movies', 'TV', 'Upcoming'];
