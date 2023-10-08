// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'political_division_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliticalDivisionType _$PoliticalDivisionTypeFromJson(
        Map<String, dynamic> json) =>
    PoliticalDivisionType(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      description: json['description'] as String?,
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

Map<String, dynamic> _$PoliticalDivisionTypeToJson(
        PoliticalDivisionType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
    };
