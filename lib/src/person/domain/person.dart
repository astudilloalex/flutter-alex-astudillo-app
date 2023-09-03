import 'package:alex_astudillo/src/person_document_type/domain/person_document_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  const Person({
    this.birthdate,
    this.code = '',
    this.documentType,
    this.documentTypeId = 0,
    this.firstName,
    this.id = 0,
    this.idCard = '',
    this.idCardVerified = false,
    this.juridicalPerson = true,
    this.lastName,
    this.socialReason,
  });

  final int id;
  final int documentTypeId;
  final String code;
  final String idCard;
  final String? firstName;
  final String? lastName;
  final String? socialReason;
  final DateTime? birthdate;
  final bool juridicalPerson;
  final bool idCardVerified;
  final PersonDocumentType? documentType;

  Person copyWith({
    int? id,
    int? documentTypeId,
    String? code,
    String? idCard,
    String? firstName,
    String? lastName,
    String? socialReason,
    DateTime? birthdate,
    bool? juridicalPerson,
    bool? idCardVerified,
    PersonDocumentType? documentType,
  }) {
    return Person(
      id: id ?? this.id,
      documentTypeId: documentTypeId ?? this.documentTypeId,
      code: code ?? this.code,
      idCard: idCard ?? this.idCard,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      socialReason: socialReason ?? this.socialReason,
      birthdate: birthdate ?? this.birthdate,
      juridicalPerson: juridicalPerson ?? this.juridicalPerson,
      idCardVerified: idCardVerified ?? this.idCardVerified,
      documentType: documentType ?? this.documentType,
    );
  }

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
