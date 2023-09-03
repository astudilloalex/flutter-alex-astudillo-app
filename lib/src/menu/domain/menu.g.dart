// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      description: json['description'] as String?,
      icon: json['icon'] as String?,
      id: json['id'] as int? ?? 0,
      inverseParent: (json['inverseParent'] as List<dynamic>?)
          ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPublic: json['isPublic'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      order: json['order'] as int? ?? 0,
      organization: json['organization'] == null
          ? null
          : Organization.fromJson(json['organization'] as Map<String, dynamic>),
      organizationId: json['organizationId'] as int? ?? 0,
      parent: json['parent'] == null
          ? null
          : Menu.fromJson(json['parent'] as Map<String, dynamic>),
      parentId: json['parentId'] as int?,
      path: json['path'] as String? ?? '',
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'parentId': instance.parentId,
      'code': instance.code,
      'name': instance.name,
      'icon': instance.icon,
      'description': instance.description,
      'path': instance.path,
      'order': instance.order,
      'isPublic': instance.isPublic,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'inverseParent': instance.inverseParent,
      'organization': instance.organization,
      'parent': instance.parent,
    };
