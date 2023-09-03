import 'package:alex_astudillo/src/permission/domain/permission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  const Role({
    this.active = true,
    this.code = '',
    this.companyCode = '',
    this.creationDate,
    this.description,
    this.editable = true,
    this.id = 0,
    this.name = '',
    this.permissions,
    this.updateDate,
    this.userId = 0,
  });

  final int id;
  final String companyCode;
  final String code;
  final String name;
  final String? description;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final bool editable;
  final int userId;
  final List<Permission>? permissions;

  Role copyWith({
    int? id,
    String? companyCode,
    String? code,
    String? name,
    String? description,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    bool? editable,
    int? userId,
    List<Permission>? permissions,
  }) {
    return Role(
      id: id ?? this.id,
      companyCode: companyCode ?? this.companyCode,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      editable: editable ?? this.editable,
      userId: userId ?? this.userId,
      permissions: permissions ?? this.permissions,
    );
  }

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
