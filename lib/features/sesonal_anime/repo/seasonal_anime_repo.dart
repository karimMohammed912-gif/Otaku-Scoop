
import 'package:otaku_scope/core/graphQL/queryes.dart';
import 'package:otaku_scope/core/repo/base_repo.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/core/models/data.dart';

class SeasonalAnimeRepo extends BaseRepo {
  SeasonalAnimeRepo(super.service);

  Future<Result<Data>> fetchSeasonalAnime({
    required int page,
    int perPage = 50,
    required String season,
  }) async {
    var query = Querys().getSeasonalAnimeQuery(page, season: season);

    return request<Data>(query: query, parser: (json) => Data.fromJson(json));
  }
}
