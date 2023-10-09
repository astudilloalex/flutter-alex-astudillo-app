import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:alex_astudillo/src/company/domain/i_company_repository.dart';
import 'package:http/http.dart';

class HttpCompanyRepository extends ICompanyRepository {
  const HttpCompanyRepository(this._client);

  final HttpBaseClient _client;

  @override
  Future<DefaultResponse> all({int? page, int? size}) async {
    final Uri uri = Uri.parse(
      '${_client.apiAuthorityV1}/company/all?page=$page&size=$size',
    );
    final Response response = await _client.get(uri);
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> findByCode(String code) async {
    final Uri uri = Uri.parse('${_client.apiAuthorityV1}/company/get/$code');
    final Response response = await _client.get(uri);
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> save(Company company) async {
    final Uri uri = Uri.parse('${_client.apiAuthorityV1}/company/add');
    final Response response = await _client.post(
      uri,
      body: await _client.parseToJson(company.toJson()),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> update(Company company) async {
    final Uri uri = Uri.parse('${_client.apiAuthorityV1}/company/add');
    final Response response = await _client.put(
      uri,
      body: await _client.parseToJson(company.toJson()),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }
}
