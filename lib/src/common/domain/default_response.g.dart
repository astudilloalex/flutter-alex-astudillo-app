// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) =>
    DefaultResponse(
      data: json['data'],
      first: json['first'] as bool? ?? true,
      last: json['last'] as bool? ?? false,
      message: json['message'] as String,
      numberOfElements: json['numberOfElements'] as int?,
      offset: json['offset'] as int?,
      pageNumber: json['pageNumber'] as int?,
      statusCode: json['statusCode'] as int,
      totalElements: json['totalElements'] as int?,
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$DefaultResponseToJson(DefaultResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'first': instance.first,
      'last': instance.last,
      'message': instance.message,
      'numberOfElements': instance.numberOfElements,
      'offset': instance.offset,
      'pageNumber': instance.pageNumber,
      'statusCode': instance.statusCode,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };
