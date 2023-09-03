import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:alex_astudillo/src/establishment_type/domain/establishment_type.dart';
import 'package:alex_astudillo/src/location/domain/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'establishment.g.dart';

@JsonSerializable()
class Establishment {
  const Establishment({
    this.active = true,
    this.code = '',
    this.company,
    this.companyId = 0,
    this.creationDate,
    this.description,
    this.establishmentType,
    this.establishmentTypeId = 0,
    this.id = 0,
    this.location,
    this.locationId = 0,
    this.name = '',
    this.updateDate,
    this.userCode,
  });

  final int id;
  final int companyId;
  final int locationId;
  final int establishmentTypeId;
  final String code;
  final String name;
  final String? description;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final String? userCode;
  final Company? company;
  final EstablishmentType? establishmentType;
  final Location? location;

  Establishment copyWith({
    int? id,
    int? companyId,
    int? locationId,
    int? establishmentTypeId,
    String? code,
    String? name,
    String? description,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    String? userCode,
    Company? company,
    EstablishmentType? establishmentType,
    Location? location,
  }) {
    return Establishment(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      locationId: locationId ?? this.locationId,
      establishmentTypeId: establishmentTypeId ?? this.establishmentTypeId,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      userCode: userCode ?? this.userCode,
      company: company ?? this.company,
      establishmentType: establishmentType ?? this.establishmentType,
      location: location ?? this.location,
    );
  }

  factory Establishment.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentFromJson(json);

  Map<String, dynamic> toJson() => _$EstablishmentToJson(this);
}
