import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:alex_astudillo/src/country/domain/i_country_repository.dart';
import 'package:http/http.dart';

class HttpCountryRepository implements ICountryRepository {
  const HttpCountryRepository(this._client);

  final HttpBaseClient _client;

  @override
  Future<DefaultResponse> all({bool? active}) async {
    final Response response = await _client.get(
      Uri.parse('${_client.apiAuthorityV1}/country/all?active=$active'),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }
}
