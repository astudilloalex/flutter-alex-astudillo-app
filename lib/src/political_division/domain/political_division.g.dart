// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'political_division.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliticalDivision _$PoliticalDivisionFromJson(Map<String, dynamic> json) =>
    PoliticalDivision(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      countryId: json['countryId'] as int? ?? 0,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      description: json['description'] as String?,
      id: json['id'] as int? ?? 0,
      inverserParent: (json['inverserParent'] as List<dynamic>?)
          ?.map((e) => PoliticalDivision.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String? ?? '',
      parent: json['parent'] == null
          ? null
          : PoliticalDivision.fromJson(json['parent'] as Map<String, dynamic>),
      parentId: json['parentId'] as int?,
      politicalDivisionType: json['politicalDivisionType'] == null
          ? null
          : PoliticalDivisionType.fromJson(
              json['politicalDivisionType'] as Map<String, dynamic>,
            ),
      politicalDivisionTypeId: json['politicalDivisionTypeId'] as int? ?? 0,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

Map<String, dynamic> _$PoliticalDivisionToJson(PoliticalDivision instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'politicalDivisionTypeId': instance.politicalDivisionTypeId,
      'parentId': instance.parentId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'politicalDivisionType': instance.politicalDivisionType,
      'parent': instance.parent,
      'inverserParent': instance.inverserParent,
    };
