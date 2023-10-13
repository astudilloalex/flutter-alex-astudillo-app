import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/src/menu/domain/i_menu_repository.dart';
import 'package:alex_astudillo/src/menu/domain/menu.dart';

class MenuService {
  const MenuService(this._repository);

  final IMenuRepository _repository;

  Future<List<Menu>> get all async {
    final DefaultResponse response = await _repository.findAll();
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return (response.data as List<dynamic>)
        .map((json) => Menu.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Menu>> get parents async {
    final DefaultResponse response = await _repository.findParents();
    if (response.statusCode != 200) {
      throw HttpException(
        code: response.statusCode,
        message: response.message,
      );
    }
    return (response.data as List<dynamic>)
        .map((json) => Menu.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
