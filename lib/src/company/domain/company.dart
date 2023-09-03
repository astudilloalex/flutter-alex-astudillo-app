import 'package:alex_astudillo/src/organization/domain/organization.dart';
import 'package:alex_astudillo/src/person/domain/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  const Company({
    this.active = true,
    this.code = '',
    this.creationDate,
    this.description,
    this.id = 0,
    this.organization,
    this.organizationId = 0,
    this.person,
    this.personId = 0,
    this.tradename = '',
    this.updateDate,
    this.userCode,
  });

  final int id;
  final int organizationId;
  final int personId;
  final String code;
  final String tradename;
  final String? description;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final String? userCode;
  final Organization? organization;
  final Person? person;

  Company copyWith({
    int? id,
    int? organizationId,
    int? personId,
    String? code,
    String? tradename,
    String? description,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    String? userCode,
    Organization? organization,
    Person? person,
  }) {
    return Company(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      personId: personId ?? this.personId,
      code: code ?? this.code,
      tradename: tradename ?? this.tradename,
      description: description ?? this.description,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      userCode: userCode ?? this.userCode,
      organization: organization ?? this.organization,
      person: person ?? this.person,
    );
  }

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
