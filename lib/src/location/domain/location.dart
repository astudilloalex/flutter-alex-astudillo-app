import 'package:alex_astudillo/src/political_division/domain/political_division.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  const Location({
    this.active = true,
    this.code = '',
    this.creationDate,
    this.houseNumber,
    this.id = 0,
    this.latitude,
    this.longitude,
    required this.mainStreet,
    this.politicalDivisionId = 0,
    this.postalCode,
    this.reference,
    this.secondaryStreet,
    this.updateDate,
    this.politicalDivision,
  });

  final int id;
  final int politicalDivisionId;
  final String code;
  final String mainStreet;
  final String? secondaryStreet;
  final String? reference;
  final String? houseNumber;
  final String? postalCode;
  final double? latitude;
  final double? longitude;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final PoliticalDivision? politicalDivision;

  Location copyWith({
    int? id,
    int? politicalDivisionId,
    String? code,
    String? mainStreet,
    String? secondaryStreet,
    String? reference,
    String? houseNumber,
    String? postalCode,
    double? latitude,
    double? longitude,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    PoliticalDivision? politicalDivision,
  }) {
    return Location(
      id: id ?? this.id,
      politicalDivisionId: politicalDivisionId ?? this.politicalDivisionId,
      code: code ?? this.code,
      mainStreet: mainStreet ?? this.mainStreet,
      secondaryStreet: secondaryStreet ?? this.secondaryStreet,
      reference: reference ?? this.reference,
      houseNumber: houseNumber ?? this.houseNumber,
      postalCode: postalCode ?? this.postalCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      politicalDivision: politicalDivision ?? this.politicalDivision,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
