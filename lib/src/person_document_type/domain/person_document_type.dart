import 'package:alex_astudillo/src/country/domain/country.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_document_type.g.dart';

@JsonSerializable()
class PersonDocumentType {
  const PersonDocumentType({
    this.active = true,
    this.code = '',
    this.country,
    this.countryId = 0,
    this.creationDate,
    this.description,
    this.id = 0,
    this.name = '',
    this.updateDate,
  });

  final int id;
  final int countryId;
  final String code;
  final String name;
  final String? description;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final Country? country;

  PersonDocumentType copyWith({
    int? id,
    int? countryId,
    String? code,
    String? name,
    String? description,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    Country? country,
  }) {
    return PersonDocumentType(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      country: country ?? this.country,
    );
  }

  factory PersonDocumentType.fromJson(Map<String, dynamic> json) =>
      _$PersonDocumentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDocumentTypeToJson(this);
}
