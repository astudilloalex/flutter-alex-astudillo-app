import 'package:alex_astudillo/src/person/domain/person.dart';
import 'package:alex_astudillo/src/provider/domain/provider.dart';
import 'package:alex_astudillo/src/role/domain/role.dart';
import 'package:alex_astudillo/src/user_metadatum/domain/user_metadatum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    this.code = '',
    this.disabled = false,
    this.displayName,
    this.email,
    this.emailVerified = false,
    this.id = 0,
    this.person,
    this.personCode,
    this.phoneNumber,
    this.photoUrl,
    this.providers,
    this.roles,
    this.tenantId,
    this.userMetadatum,
    this.username,
  });

  final int id;
  final String? personCode;
  final String code;
  final String? displayName;
  final String? email;
  final bool emailVerified;
  final String? photoUrl;
  final String? phoneNumber;
  final bool disabled;
  final String? tenantId;
  final String? username;
  final List<Role>? roles;
  final UserMetadatum? userMetadatum;
  final List<Provider>? providers;
  final Person? person;

  User copyWith({
    int? id,
    String? personCode,
    String? code,
    String? displayName,
    String? email,
    bool? emailVerified,
    String? photoUrl,
    String? phoneNumber,
    bool? disabled,
    String? tenantId,
    String? username,
    List<Role>? roles,
    UserMetadatum? userMetadatum,
    List<Provider>? providers,
    Person? person,
  }) {
    return User(
      id: id ?? this.id,
      personCode: personCode ?? this.personCode,
      code: code ?? this.code,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      disabled: disabled ?? this.disabled,
      tenantId: tenantId ?? this.tenantId,
      username: username ?? this.username,
      roles: roles ?? this.roles,
      userMetadatum: userMetadatum ?? this.userMetadatum,
      providers: providers ?? this.providers,
      person: person ?? this.person,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
