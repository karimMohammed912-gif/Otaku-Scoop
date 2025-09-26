import 'dart:developer' as dev;

import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/errors/failure.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/features/details_feature/model/details_model/details_model/data.dart';
import 'package:otaku_scope/features/details_feature/model/details_model/details_model/media.dart'
    as details_types;
import 'package:otaku_scope/features/details_feature/repo/details_repo.dart';

class MangaDetailsState {
  final bool isLoading;
  final details_types.Media? media;
  final String? error;

  const MangaDetailsState({
    required this.isLoading,
    required this.media,
    required this.error,
  });

  factory MangaDetailsState.initial() =>
      const MangaDetailsState(isLoading: false, media: null, error: null);

  MangaDetailsState copyWith({
    bool? isLoading,
    details_types.Media? media,
    String? error,
  }) {
    return MangaDetailsState(
      isLoading: isLoading ?? this.isLoading,
      media: media ?? this.media,
      error: error,
    );
  }
}

class MangaDetailsController extends StateNotifier<MangaDetailsState> {
  final AnimeDetailsRepo _repo;
  MangaDetailsController(this._repo) : super(MangaDetailsState.initial());

  Future<void> load(int id) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, error: null);
    final Result<Data> res = await _repo.fetchDetails(id: id, type: 'MANGA');
    res.when(
      success: (data) {
        final media = data.media;
        dev.log('Manga details loaded: $media');
        state = state.copyWith(isLoading: false, media: media, error: null);
      },
      failure: (f) {
        String message = f.toString();
        if (f is ServerFailure && f.statusCode == 429) {
          message = 'Rate limited. Please try again shortly.';
        }
        state = state.copyWith(isLoading: false, media: null, error: message);
      },
    );
  }

  void clear() {
    state = MangaDetailsState.initial();
  }
}
