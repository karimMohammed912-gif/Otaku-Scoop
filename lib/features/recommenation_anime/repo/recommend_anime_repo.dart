import 'dart:math';

import 'package:otaku_scope/core/graphQL/queryes.dart';
import 'package:otaku_scope/core/repo/base_repo.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/core/models/data.dart';

class RecommendAnimeRepo extends BaseRepo {
  RecommendAnimeRepo(super.service);

  Future<Result<Data>> fetchRecommendationAnime({
    required int page,
    int perPage = 50,
  }) async {
    final randomId = Random().nextInt(20000); // random anime ID

    var query = Querys().getRecommendationAnimeQuery(randomId, page);

    return request<Data>(query: query, parser: (json) => Data.fromJson(json));
  }
}
