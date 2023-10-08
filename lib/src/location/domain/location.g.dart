// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      houseNumber: json['houseNumber'] as String?,
      id: json['id'] as int? ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      mainStreet: json['mainStreet'] as String,
      politicalDivisionId: json['politicalDivisionId'] as int? ?? 0,
      postalCode: json['postalCode'] as String?,
      reference: json['reference'] as String?,
      secondaryStreet: json['secondaryStreet'] as String?,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      politicalDivision: json['politicalDivision'] == null
          ? null
          : PoliticalDivision.fromJson(
              json['politicalDivision'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'politicalDivisionId': instance.politicalDivisionId,
      'code': instance.code,
      'mainStreet': instance.mainStreet,
      'secondaryStreet': instance.secondaryStreet,
      'reference': instance.reference,
      'houseNumber': instance.houseNumber,
      'postalCode': instance.postalCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'politicalDivision': instance.politicalDivision,
    };
