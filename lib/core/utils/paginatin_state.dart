class PaginatedState<T> {
  final List<dynamic> items;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final int currentPage;
  final bool hasNextPage;

  // FIX: Create a full constructor with default values.
  const PaginatedState({
    this.items = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.currentPage = 0,
    this.hasNextPage = true,
  });

  static PaginatedState<T> initial<T>() => const PaginatedState();


  PaginatedState<T> copyWith({
    List<dynamic>? items,
    bool? isLoading,
    bool? isLoadingMore,
    Object? error = const Object(),
    int? currentPage,
    bool? hasNextPage,
  }) {
    return PaginatedState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error == const Object() ? this.error : error as String?,
      currentPage: currentPage ?? this.currentPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}
