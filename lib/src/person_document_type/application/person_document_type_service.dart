import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/src/person_document_type/domain/i_person_document_type_repository.dart';
import 'package:alex_astudillo/src/person_document_type/domain/person_document_type.dart';

class PersonDocumentTypeService {
  const PersonDocumentTypeService(this._repository);

  final IPersonDocumentTypeRepository _repository;

  Future<List<PersonDocumentType>> getByCountryCode(
    String countryCode, [
    bool? active,
  ]) async {
    final DefaultResponse response = await _repository.findByCountryCode(
      countryCode,
      active,
    );
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return (response.data as List<dynamic>)
        .map(
          (json) => PersonDocumentType.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
