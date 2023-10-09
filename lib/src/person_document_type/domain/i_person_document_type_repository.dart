import 'package:alex_astudillo/src/common/domain/default_response.dart';

abstract class IPersonDocumentTypeRepository {
  const IPersonDocumentTypeRepository();

  Future<DefaultResponse> findByCountryCode(String countryCode, [bool? active]);
}
