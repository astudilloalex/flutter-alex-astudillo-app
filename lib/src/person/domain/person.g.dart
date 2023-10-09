// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      birthdate: json['birthdate'] == null
          ? null
          : DateTime.parse(json['birthdate'] as String),
      code: json['code'] as String? ?? '',
      documentType: json['documentType'] == null
          ? null
          : PersonDocumentType.fromJson(
              json['documentType'] as Map<String, dynamic>,
            ),
      personDocumentTypeId: json['documentTypeId'] as int? ?? 0,
      firstName: json['firstName'] as String?,
      id: json['id'] as int? ?? 0,
      idCard: json['idCard'] as String? ?? '',
      idCardVerified: json['idCardVerified'] as bool? ?? false,
      juridicalPerson: json['juridicalPerson'] as bool? ?? true,
      lastName: json['lastName'] as String?,
      socialReason: json['socialReason'] as String?,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'documentTypeId': instance.personDocumentTypeId,
      'code': instance.code,
      'idCard': instance.idCard,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'socialReason': instance.socialReason,
      'birthdate': instance.birthdate?.toIso8601String(),
      'juridicalPerson': instance.juridicalPerson,
      'idCardVerified': instance.idCardVerified,
      'documentType': instance.documentType,
    };
