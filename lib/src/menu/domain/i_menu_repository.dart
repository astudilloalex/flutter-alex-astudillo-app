import 'package:alex_astudillo/src/common/domain/default_response.dart';

abstract class IMenuRepository {
  const IMenuRepository();

  Future<DefaultResponse> findAll();

  Future<DefaultResponse> findParents();
}
