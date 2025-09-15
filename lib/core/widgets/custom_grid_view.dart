import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/core/widgets/grid_item_widget.dart';
import 'package:otaku_scope/features/top_anime/model/top_anime_model/media.dart';

class CustomGridView<T extends StateNotifier<PaginatedState<Media>>>
    extends ConsumerStatefulWidget {
  const CustomGridView({this.provider, super.key});

  final StateNotifierProvider<T, PaginatedState<Media>>? provider;

  @override
  ConsumerState<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends ConsumerState<CustomGridView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _itemAnimations;
    final ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true ;
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final notifier = ref.read(widget.provider!.notifier);
      // Call loadFirstPage if it exists on the notifier
      if ((notifier as dynamic).loadFirstPage != null) {
        (notifier as dynamic).loadFirstPage();
      }
    });
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scrollController.addListener(()  {
      // Trigger loadMore when near the bottom
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        final notifier = ref.read(widget.provider!.notifier);
        if ((notifier as dynamic).loadMore != null) {
          (notifier as dynamic).loadMore();
        }
      }
    });

    // Create staggered animations for grid items
    _itemAnimations = List.generate(20, (index) {
      final delay = index * 0.0005; // 50ms delay between items
      final start = (delay).clamp(0.0, 0.8);
      final end = (start + 0.4).clamp(0.2, 1.0);

      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(start, end, curve: Curves.linear),
        ),
      );
    });

    // Start animation after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(widget.provider!);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error: ${state.error}"),
            ElevatedButton(
              onPressed: () {
                final notifier = ref.read(widget.provider!.notifier);
                if ((notifier as dynamic).refresh != null) {
                  (notifier as dynamic).refresh();
                }
              },
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        final notifier = ref.read(widget.provider!.notifier);
        if ((notifier as dynamic).refresh != null) {
          (notifier as dynamic).refresh();
        }
      },
      child: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(8.0),
        physics: const BouncingScrollPhysics(),
        // FIX: Add 1 to the item count if we are loading more data
        itemCount: state.items.length + (state.isLoadingMore ? 1 : 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 9 / 16,
        ),
        itemBuilder: (context, index) {
          // FIX: If this is the extra item, show a loading indicator
          if (index >= state.items.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final animationIndex = index % _itemAnimations.length;

          return AnimatedBuilder(
            animation: _itemAnimations[animationIndex],
            builder: (context, child) {
              return FadeScaleTransition(
                animation: _itemAnimations[animationIndex],
                child: GridItemWidget(
                  imageUrl: state.items[index].coverImage!.large ?? '',
                  title: state.items[index].title!.english ??
                      state.items[index].title!.romaji ??
                      '',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
