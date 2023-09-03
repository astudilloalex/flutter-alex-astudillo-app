import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission {
  const Permission({
    this.action = '',
    this.active = true,
    this.code = '',
    this.description = '',
    this.id = 0,
    this.name = '',
  });

  final int id;
  final String code;
  final String action;
  final String name;
  final String description;
  final bool active;

  Permission copyWith({
    int? id,
    String? code,
    String? action,
    String? name,
    String? description,
    bool? active,
  }) {
    return Permission(
      id: id ?? this.id,
      code: code ?? this.code,
      action: action ?? this.action,
      name: name ?? this.name,
      description: description ?? this.description,
      active: active ?? this.active,
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
