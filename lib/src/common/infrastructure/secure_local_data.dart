import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalData {
  const SecureLocalData({
    this.secureStorage = const FlutterSecureStorage(),
  });

  final FlutterSecureStorage secureStorage;

  Future<String?> get jwt => secureStorage.read(key: 'idToken');

  Future<String?> get refreshToken => secureStorage.read(key: 'refreshToken');

  Future<void> saveJWT(String? jwt) {
    return secureStorage.write(key: 'idToken', value: jwt);
  }

  Future<void> saveRefreshToken(String? refreshToken) {
    return secureStorage.write(key: 'refreshToken', value: refreshToken);
  }
}
