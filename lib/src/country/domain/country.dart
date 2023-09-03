import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  const Country({
    this.active = true,
    this.code = '',
    this.creationDate,
    this.description,
    this.dialInCodes = '',
    this.id = 0,
    this.name = '',
    this.updateDate,
  });

  final int id;
  final String code;
  final String name;
  final String? description;
  final String dialInCodes;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;

  Country copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    String? dialInCodes,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
  }) {
    return Country(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      dialInCodes: dialInCodes ?? this.dialInCodes,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
    );
  }

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
