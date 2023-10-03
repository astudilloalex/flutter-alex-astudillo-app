// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      idToken: json['idToken'] as String? ?? '',
      expiresIn: json['expiresIn'] as String? ?? '3600',
      localId: json['localId'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'localId': instance.localId,
    };
