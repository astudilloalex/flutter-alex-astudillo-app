// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      description: json['description'] as String?,
      id: json['id'] as int? ?? 0,
      organization: json['organization'] == null
          ? null
          : Organization.fromJson(json['organization'] as Map<String, dynamic>),
      organizationId: json['organizationId'] as int?,
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      personId: json['personId'] as int? ?? 0,
      tradename: json['tradename'] as String? ?? '',
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      userCode: json['userCode'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'personId': instance.personId,
      'code': instance.code,
      'tradename': instance.tradename,
      'description': instance.description,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'userCode': instance.userCode,
      'organization': instance.organization,
      'person': instance.person,
    };
