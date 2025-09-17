import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'package:otaku_scope/core/utils/enums.dart';
import 'package:otaku_scope/core/widgets/custom_grid_view.dart';

class SeasonalView extends ConsumerWidget {
  const SeasonalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> tabs = SeasonsCategory.values.map((e) => e.name.toUpperCase()).toList();
    return DefaultTabController(
    
      length: tabs.length,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
        ), // Adjust the spacing as needed
        child: Column(
          children: [
            TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
            Expanded(
              child: TabBarView(
                children: [
                  CustomGridView(
                    provider: seasonalAnimeNotifierProvider(SeasonsCategory.winter.name.toUpperCase()),
                  ),
                  CustomGridView(
                    provider: seasonalAnimeNotifierProvider( SeasonsCategory.spring.name.toUpperCase() ,
                  ),
                  ),
                  CustomGridView(
                    provider: seasonalAnimeNotifierProvider(SeasonsCategory.summer.name.toUpperCase()),
                  ),
                  CustomGridView(
                    provider: seasonalAnimeNotifierProvider(SeasonsCategory.fall.name.toUpperCase()),
                  ),
                  
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
