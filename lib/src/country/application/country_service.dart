import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/src/country/domain/country.dart';
import 'package:alex_astudillo/src/country/domain/i_country_repository.dart';

class CountryService {
  const CountryService(this._repository);

  final ICountryRepository _repository;

  Future<List<Country>> all({bool? active}) async {
    final DefaultResponse response = await _repository.all(active: active);
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return (response.data as List<dynamic>)
        .map((json) => Country.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
