import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:alex_astudillo/src/menu/domain/i_menu_repository.dart';
import 'package:http/http.dart';

class HttpMenuRepository implements IMenuRepository {
  const HttpMenuRepository(this._client);

  final HttpBaseClient _client;

  @override
  Future<DefaultResponse> findAll() async {
    final Response response = await _client.get(
      Uri.parse('${_client.apiAuthorityV1}/menu/all'),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> findParents() async {
    final Response response = await _client.get(
      Uri.parse('${_client.apiAuthorityV1}/menu/all/parents'),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }
}
