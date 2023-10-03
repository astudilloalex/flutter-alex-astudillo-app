import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/common/infrastructure/secure_local_data.dart';

class AuthService {
  const AuthService(
    this._repository, {
    required this.secureLocalData,
  });

  final IAuthRepository _repository;
  final SecureLocalData secureLocalData;
}
