import 'package:alex_astudillo/src/auth/domain/auth_response.dart';
import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/common/domain/default_response.dart';
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
    if (response.statusCode != 200) {}
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
