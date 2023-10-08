import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/src/common/domain/page.dart';
import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:alex_astudillo/src/company/domain/i_company_repository.dart';

class CompanyService {
  const CompanyService(this._repository);

  final ICompanyRepository _repository;

  Future<Page<Company>> all([int? page, int? size]) async {
    final DefaultResponse response = await _repository.all(
      page: page,
      size: size,
    );
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return Page.fromDefaultResponse<Company>(response);
  }
}
