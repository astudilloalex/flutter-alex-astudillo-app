import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:http/http.dart';

class HttpAuthRepository implements IAuthRepository {
  const HttpAuthRepository(this._client);

  final HttpBaseClient _client;

  @override
  Future<DefaultResponse> confirmEmailVerification(String oobCode) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthorityV1}/user/confirm-email-verification'),
      body: await _client.parseToJson({'oobCode': oobCode}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> confirmPasswordReset(
    String oobCode,
    String newPassword,
  ) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthorityV1}/user/confirm-password-reset'),
      body: await _client.parseToJson({
        'oobCode': oobCode,
        'newPassword': newPassword,
      }),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> exchangeRefreshToken(String refreshToken) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthorityV1}/user/exchange-refresh-token'),
      body: await _client.parseToJson({'refreshToken': refreshToken}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> sendEmailVerification() async {
    final Response response = await _client.get(
      Uri.parse('${_client.apiAuthorityV1}/user/send-email-verification'),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> sendPasswordResetEmail(String email) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthorityV1}/user/send-password-reset-email'),
      body: await _client.parseToJson({'email': email}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> signIn(String email, String password) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthorityV1}/user/sign-in'),
      body: await _client.parseToJson({'email': email, 'password': password}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  Future<DefaultResponse> signUp(String email, String password) async {
    final Response response = await _client.post(
      Uri.parse('${_client.apiAuthorityV1}/user/sign-up'),
      body: await _client.parseToJson({'email': email, 'password': password}),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }

  @override
  // TODO: implement current
  Future<DefaultResponse> get current async {
    final Response response = await _client.get(
      Uri.parse('${_client.apiAuthorityV1}/user/current'),
    );
    return DefaultResponse.fromJson(await _client.parseFromJson(response.body));
  }
}
