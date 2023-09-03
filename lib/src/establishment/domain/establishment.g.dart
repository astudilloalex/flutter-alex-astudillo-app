// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Establishment _$EstablishmentFromJson(Map<String, dynamic> json) =>
    Establishment(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      companyId: json['companyId'] as int? ?? 0,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      description: json['description'] as String?,
      establishmentType: json['establishmentType'] == null
          ? null
          : EstablishmentType.fromJson(
              json['establishmentType'] as Map<String, dynamic>),
      establishmentTypeId: json['establishmentTypeId'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      locationId: json['locationId'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      userCode: json['userCode'] as String?,
    );

Map<String, dynamic> _$EstablishmentToJson(Establishment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'locationId': instance.locationId,
      'establishmentTypeId': instance.establishmentTypeId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'userCode': instance.userCode,
      'company': instance.company,
      'establishmentType': instance.establishmentType,
      'location': instance.location,
    };
