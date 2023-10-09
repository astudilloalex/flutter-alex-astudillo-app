import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:alex_astudillo/src/person_document_type/domain/i_person_document_type_repository.dart';
import 'package:http/http.dart';

class HttpPersonDocumentTypeRepository
    implements IPersonDocumentTypeRepository {
  const HttpPersonDocumentTypeRepository(this._client);

  final HttpBaseClient _client;

  @override
  Future<DefaultResponse> findByCountryCode(
    String countryCode, [
    bool? active,
  ]) async {
    final Response response = await _client.get(
      Uri.parse(
        '${_client.apiAuthorityV1}/person-document-type/all/$countryCode?active=$active',
      ),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }
}
