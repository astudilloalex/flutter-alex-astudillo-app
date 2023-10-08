import 'package:alex_astudillo/src/auth/application/auth_service.dart';
import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/auth/infrastructure/http_auth_repository.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:alex_astudillo/src/common/infrastructure/secure_local_data.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

GetIt getIt = GetIt.instance;

bool _canRefreshToken(String path) {
  if (path.contains('/sign-in')) return false;
  if (path.contains('/sign-up')) return false;
  if (path.contains('/confirm-email-verification')) return false;
  if (path.contains('/confirm-password-reset')) return false;
  if (path.contains('/exchange-refresh-token')) return false;
  if (path.contains('/send-password-reset-email')) return false;
  return true;
}

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
            _canRefreshToken(request.url.path)) {
          await getIt<AuthService>().exchangeRefreshToken();
        }
      },
    ),
    secureLocalData: getIt<SecureLocalData>(),
  );

  getIt.registerSingleton<IAuthRepository>(HttpAuthRepository(httpClient));

  getIt.registerFactory<AuthService>(
    () => AuthService(
      getIt<IAuthRepository>(),
      secureLocalData: getIt<SecureLocalData>(),
    ),
  );
}
