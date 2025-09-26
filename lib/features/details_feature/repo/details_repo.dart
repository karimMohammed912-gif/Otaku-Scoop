import 'package:otaku_scope/core/graphQL/queryes.dart';
import 'package:otaku_scope/core/repo/base_repo.dart';
import 'package:otaku_scope/core/utils/result.dart';
import 'package:otaku_scope/features/details_feature/model/details_model/details_model/data.dart';

class AnimeDetailsRepo extends BaseRepo {
  AnimeDetailsRepo(super.service);

  Future<Result<Data>> fetchDetails({required int id, required String type}) async {
    final query = Querys().getDetailsQuery(id:id, type: type);
    return request<Data>(
      query: query,
      parser: (json) => Data.fromJson(json),
    );
  }
}


