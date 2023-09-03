// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_document_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDocumentType _$PersonDocumentTypeFromJson(Map<String, dynamic> json) =>
    PersonDocumentType(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      countryId: json['countryId'] as int? ?? 0,
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

Map<String, dynamic> _$PersonDocumentTypeToJson(PersonDocumentType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'country': instance.country,
    };
