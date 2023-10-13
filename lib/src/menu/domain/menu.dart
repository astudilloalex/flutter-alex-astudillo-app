import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  const Menu({
    this.active = true,
    this.code = '',
    this.creationDate,
    this.description,
    this.icon,
    this.id = 0,
    this.inverseParent,
    this.isPublic = false,
    this.name = '',
    this.order = 0,
    this.parent,
    this.parentId,
    this.path = '',
    this.updateDate,
  });

  final int id;
  final int? parentId;
  final String code;
  final String name;
  final String? icon;
  final String? description;
  final String path;
  final int order;
  final bool isPublic;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final List<Menu>? inverseParent;
  final Menu? parent;

  Menu copyWith({
    int? id,
    int? parentId,
    String? code,
    String? name,
    String? icon,
    String? description,
    String? path,
    int? order,
    bool? isPublic,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    List<Menu>? inverseParent,
    Menu? parent,
  }) {
    return Menu(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      code: code ?? this.code,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      path: path ?? this.path,
      order: order ?? this.order,
      isPublic: isPublic ?? this.isPublic,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      inverseParent: inverseParent ?? this.inverseParent,
      parent: parent ?? this.parent,
    );
  }

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
