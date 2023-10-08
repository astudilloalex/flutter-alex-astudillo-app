import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/company/domain/company.dart';

abstract class ICompanyRepository {
  const ICompanyRepository();

  Future<DefaultResponse> all({int? page, int? size});

  Future<DefaultResponse> findByCode(String code);

  Future<DefaultResponse> save(Company company);

  Future<DefaultResponse> update(Company company);
}
