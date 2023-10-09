import 'package:alex_astudillo/src/common/domain/default_response.dart';

abstract class ICountryRepository {
  const ICountryRepository();

  Future<DefaultResponse> all({bool? active});
}
