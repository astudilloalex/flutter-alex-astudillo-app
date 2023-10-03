import 'package:alex_astudillo/src/auth/domain/i_auth_repository.dart';
import 'package:alex_astudillo/src/auth/infrastructure/auth_repository.dart';
import 'package:alex_astudillo/src/common/infrastructure/http_base_client.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  final HttpBaseClient httpClient = HttpBaseClient(
    client: RetryClient(
      Client(),
      retries: 1,
      when: (response) {
        return response.statusCode == 401;
      },
      onRetry: (request, response, retryCount) {},
    ),
  );
  getIt.registerSingleton<IAuthRepository>(AuthRepository(httpClient));
}
