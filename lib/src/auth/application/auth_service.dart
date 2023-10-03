import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';

class AuthService {
  const AuthService(this._repository);

  final IAuthRepository _repository;
}
