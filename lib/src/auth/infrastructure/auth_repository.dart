import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:http/http.dart';

class AuthRepository implements IAuthRepository {
  const AuthRepository(this._client);

  final HttpBaseClient _client;

  @override
  Future<DefaultResponse> exchangeRefreshToken(String refreshToken) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthority}/user/exchange-refresh-token'),
      body: await _client.parseToJson({'refreshToken': refreshToken}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> signIn(String email, String password) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthority}/user/sign-in'),
      body: await _client.parseToJson({'email': email, 'password': password}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> signUp(String email, String password) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthority}/user/sign-up'),
      body: await _client.parseToJson({'email': email, 'password': password}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }
}
