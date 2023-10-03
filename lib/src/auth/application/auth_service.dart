import 'package:alex_astudillo/src/auth/domain/auth_response.dart';
import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/src/common/infrastructure/secure_local_data.dart';

class AuthService {
  const AuthService(
    this._repository, {
    required this.secureLocalData,
  });

  final IAuthRepository _repository;
  final SecureLocalData secureLocalData;

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

  Future<AuthResponse> exchangeRefreshToken() async {
    final DefaultResponse response = await _repository.exchangeRefreshToken(
      await secureLocalData.refreshToken ?? '',
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
}
