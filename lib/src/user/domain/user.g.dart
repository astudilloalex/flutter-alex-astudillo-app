// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      code: json['code'] as String? ?? '',
      disabled: json['disabled'] as bool? ?? false,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      id: json['id'] as int? ?? 0,
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      personId: json['personId'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      providers: (json['providers'] as List<dynamic>?)
          ?.map((e) => Provider.fromJson(e as Map<String, dynamic>))
          .toList(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      tenantId: json['tenantId'] as String?,
      userMetadatum: json['userMetadatum'] == null
          ? null
          : UserMetadatum.fromJson(
              json['userMetadatum'] as Map<String, dynamic>),
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'personId': instance.personId,
      'code': instance.code,
      'displayName': instance.displayName,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'disabled': instance.disabled,
      'tenantId': instance.tenantId,
      'username': instance.username,
      'roles': instance.roles,
      'userMetadatum': instance.userMetadatum,
      'providers': instance.providers,
      'person': instance.person,
    };
