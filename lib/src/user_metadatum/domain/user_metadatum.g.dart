// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_metadatum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMetadatum _$UserMetadatumFromJson(Map<String, dynamic> json) =>
    UserMetadatum(
      creationTimestamp: DateTime.parse(json['creationTimestamp'] as String),
      lastRefreshTimestamp: json['lastRefreshTimestamp'] == null
          ? null
          : DateTime.parse(json['lastRefreshTimestamp'] as String),
      lastSignInTimestamp: json['lastSignInTimestamp'] == null
          ? null
          : DateTime.parse(json['lastSignInTimestamp'] as String),
      userId: json['userId'] as int? ?? 0,
    );

Map<String, dynamic> _$UserMetadatumToJson(UserMetadatum instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'creationTimestamp': instance.creationTimestamp.toIso8601String(),
      'lastRefreshTimestamp': instance.lastRefreshTimestamp?.toIso8601String(),
      'lastSignInTimestamp': instance.lastSignInTimestamp?.toIso8601String(),
    };
