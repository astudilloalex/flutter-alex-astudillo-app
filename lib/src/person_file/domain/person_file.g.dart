// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonFile _$PersonFileFromJson(Map<String, dynamic> json) => PersonFile(
      active: json['active'] as bool? ?? true,
      file: json['file'] == null
          ? null
          : File.fromJson(json['file'] as Map<String, dynamic>),
      fileId: json['fileId'] as int? ?? 0,
      personId: json['personId'] as int? ?? 0,
      type: json['type'] as String? ?? 'P',
    );

Map<String, dynamic> _$PersonFileToJson(PersonFile instance) =>
    <String, dynamic>{
      'personId': instance.personId,
      'fileId': instance.fileId,
      'type': instance.type,
      'active': instance.active,
      'file': instance.file,
    };
