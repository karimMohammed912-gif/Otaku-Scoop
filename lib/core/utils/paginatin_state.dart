class PaginatedState<T> {
  final List<T>? items;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final int currentPage;
  final bool hasNextPage;

  const PaginatedState({
    required this.items,
    required this.isLoading,
    required this.isLoadingMore,
    required this.error,
    required this.currentPage,
    required this.hasNextPage,
  });

  factory PaginatedState.initial() => const PaginatedState(
        items: null,
        isLoading: false,
        isLoadingMore: false,
        error: null,
        currentPage: 0,
        hasNextPage: true,
      );

  PaginatedState<T> copyWith({
    List<T>? items,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? currentPage,
    bool? hasNextPage,
  }) {
    return PaginatedState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      currentPage: currentPage ?? this.currentPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}
