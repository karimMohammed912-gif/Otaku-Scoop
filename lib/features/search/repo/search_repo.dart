import 'package:otaku_scope/core/graphQL/queryes.dart';
import 'package:otaku_scope/core/repo/base_repo.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/core/models/data.dart';

class SearchRepo extends BaseRepo {
  SearchRepo(super.service);

  Future<Result<Data>> fetchSearch({
    required String search,
    required int page,
  }) async {
    final query = Querys().getSearchQuery(search: search, page: page);
    return request<Data>(query: query, parser: (json) => Data.fromJson(json));
  }
}
