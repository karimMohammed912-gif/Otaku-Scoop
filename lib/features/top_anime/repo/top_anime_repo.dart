
import 'package:otaku_scope/core/graphQL/queryes.dart';
import 'package:otaku_scope/core/repo/base_repo.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/features/top_anime/model/top_anime_model/top_anime_model.dart';

class TopAnimeRepo extends BaseRepo {
  TopAnimeRepo(super.service);

  Future<Result<TopAnimeModel>> fetchTopAnime({
    required int page,
    int perPage = 20,
  }) async {
    var query = Querys().getTopAnimeQuery(perPage: 25, page: 1);

    return request<TopAnimeModel>(
      query: query,
      variables: {
        "page": page,
        "perPage": perPage,
      },
      parser: (json) => TopAnimeModel.fromJson(json["data"]["Page"]),
    );
  }
}
