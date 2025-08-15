import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/widgets/custom_grid_view.dart';

class SeasonalView extends ConsumerWidget {
  const SeasonalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ['Winter', 'Spring', 'Summer', 'Fall'];
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
                children: tabs
                    .map((e) => Padding(
                      padding: const EdgeInsets.symmetric( horizontal:  8.0),
                      child: const CustomGridView(),
                    )) // Replace with your actual content widgets
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
