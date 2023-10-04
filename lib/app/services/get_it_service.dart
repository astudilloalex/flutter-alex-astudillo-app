import 'package:alex_astudillo/src/auth/application/auth_service.dart';
import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/auth/infrastructure/auth_repository.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:alex_astudillo/src/common/infrastructure/secure_local_data.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<SecureLocalData>(const SecureLocalData());

  /// Retry client to refresh token.
  final HttpBaseClient httpClient = HttpBaseClient(
    client: RetryClient(
      Client(),
      retries: 1,
      when: (response) {
        return response.statusCode == 401;
      },
      onRetry: (request, response, retryCount) async {
        if (retryCount == 0 &&
            response?.statusCode == 401 &&
            !request.url.path.contains('/sign-in') &&
            !request.url.path.contains('/sign-up')) {
          await getIt<AuthService>().exchangeRefreshToken();
        }
      },
    ),
    secureLocalData: getIt<SecureLocalData>(),
  );

  getIt.registerSingleton<IAuthRepository>(AuthRepository(httpClient));

  getIt.registerFactory<AuthService>(
    () => AuthService(
      getIt<IAuthRepository>(),
      secureLocalData: getIt<SecureLocalData>(),
    ),
  );
}
