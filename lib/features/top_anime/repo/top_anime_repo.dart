import 'package:otaku_scope/core/graphQL/queryes.dart';
import 'package:otaku_scope/core/repo/base_repo.dart';
import 'package:otaku_scope/core/utils/enums.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/core/models/data.dart';

class TopAnimeRepo extends BaseRepo {
  TopAnimeRepo(super.service);

  Future<Result<Data>> fetchTopAnime({
    required int page,
    required TopAnimeCategory category,
    int perPage = 50,
  }) async {
    var query = Querys().getTopAnimeQuery(
      perPage: perPage,
      page: page,
      category: category,
    );

    return request<Data>(query: query, parser: (json) => Data.fromJson(json));
  }
}
