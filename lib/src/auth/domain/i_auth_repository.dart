import 'package:alex_astudillo/src/common/domain/default_response.dart';

abstract class IAuthRepository {
  const IAuthRepository();

  Future<DefaultResponse> exchangeRefreshToken(String refreshToken);

  Future<DefaultResponse> signIn(String email, String password);

  Future<DefaultResponse> signUp(String email, String password);
}
