import 'package:otaku_scope/core/graphQL/queries.dart';
import 'package:otaku_scope/core/repo/base_repo.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/core/models/data.dart';

class LastUpdateMangaRepo extends BaseRepo {
  LastUpdateMangaRepo(super.service);

  Future<Result<Data>> fetchLastUpdateManga({
    required int page,
    int perPage = 50,
  }) async {
    var query = Querys().getLatestMangaQuery(page);

    return request<Data>(query: query, parser: (json) => Data.fromJson(json));
  }
}
