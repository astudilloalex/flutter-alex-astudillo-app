import 'package:alex_astudillo/src/auth/domain/auth_response.dart';
import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/src/common/infrastructure/secure_local_data.dart';
import 'package:alex_astudillo/src/user/domain/user.dart';

class AuthService {
  const AuthService(
    this._repository, {
    required this.secureLocalData,
  });

  final IAuthRepository _repository;
  final SecureLocalData secureLocalData;

  Future<User> confirmEmailVerification(String oobCode) async {
    final DefaultResponse response = await _repository.confirmEmailVerification(
      oobCode,
    );
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  /// Used for validate oob code sent to user email and new password to change.
  ///
  /// Returns a email linked to the account when change password.
  Future<String> confirmPasswordReset(
    String oobCode,
    String newPassword,
  ) async {
    final DefaultResponse response = await _repository.confirmPasswordReset(
      oobCode,
      newPassword,
    );
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return response.data as String;
  }

  Future<AuthResponse> exchangeRefreshToken() async {
    final String? refreshToken = await secureLocalData.refreshToken;
    if (refreshToken == null) throw Exception('refresh-token-null');
    final DefaultResponse response = await _repository.exchangeRefreshToken(
      refreshToken,
    );
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    final AuthResponse authResponse = AuthResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    await secureLocalData.saveJWT(authResponse.idToken);
    await secureLocalData.saveRefreshToken(authResponse.refreshToken);
    return authResponse;
  }

  Future<String> sendEmailVerificationAsync() async {
    final DefaultResponse response = await _repository.sendEmailVerification();
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return response.data as String;
  }

  Future<String> sendPasswordResetEmail(String email) async {
    final DefaultResponse response = await _repository.sendPasswordResetEmail(
      email,
    );
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return response.data as String;
  }

  Future<AuthResponse> signIn(String email, String password) async {
    final DefaultResponse response = await _repository.signIn(email, password);
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    final AuthResponse authResponse = AuthResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    await secureLocalData.saveJWT(authResponse.idToken);
    await secureLocalData.saveRefreshToken(authResponse.refreshToken);
    return authResponse;
  }

  Future<AuthResponse> signUp(String email, String password) async {
    final DefaultResponse response = await _repository.signUp(email, password);
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    final AuthResponse authResponse = AuthResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    await secureLocalData.saveJWT(authResponse.idToken);
    await secureLocalData.saveRefreshToken(authResponse.refreshToken);
    return authResponse;
  }

  Future<User> get current async {
    final DefaultResponse response = await _repository.current;
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return User.fromJson(response.data as Map<String, dynamic>);
  }
}
