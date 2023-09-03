// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => File(
      active: json['active'] as bool? ?? true,
      code: json['code'] as String? ?? '',
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      extension: json['extension'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      url: json['url'] as String? ?? '',
      userCode: json['userCode'] as String? ?? '',
    );

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'extension': instance.extension,
      'name': instance.name,
      'url': instance.url,
      'active': instance.active,
      'creationDate': instance.creationDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'userCode': instance.userCode,
    };
