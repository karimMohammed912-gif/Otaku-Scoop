import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'package:otaku_scope/core/utils/paginatin_state.dart';
import 'package:otaku_scope/core/widgets/custom_grid_view.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSubmitted(String value) {
    ref.read(searchNotifierProvider.notifier).setQuery(value);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchNotifierProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search anime...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: _onSubmitted,
            ),
          ),
          Expanded(child: _buildBody(state)),
        ],
      ),
    );
  }

  Widget _buildBody(PaginatedState state) {
    if (state.isLoading && state.items.isEmpty) {
      // Reuse grid with empty provider to keep UI consistent
      return const Center(child: CircularProgressIndicator());
    }
    if (!state.isLoading &&
        state.items.isEmpty &&
        _controller.text.trim().isNotEmpty) {
      return const Center(child: Text('No results'));
    }

    return CustomGridView(provider: searchNotifierProvider);
  }
}
