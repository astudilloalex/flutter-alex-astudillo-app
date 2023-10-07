import 'package:alex_astudillo/src/common/domain/default_response.dart';

abstract class IAuthRepository {
  const IAuthRepository();

  Future<DefaultResponse> confirmEmailVerification(String oobCode);

  Future<DefaultResponse> confirmPasswordReset(
    String oobCode,
    String newPassword,
  );

  Future<DefaultResponse> exchangeRefreshToken(String refreshToken);

  Future<DefaultResponse> sendEmailVerification();

  Future<DefaultResponse> sendPasswordResetEmail(String email);

  Future<DefaultResponse> signIn(String email, String password);

  Future<DefaultResponse> signUp(String email, String password);

  Future<DefaultResponse> get current;
}
