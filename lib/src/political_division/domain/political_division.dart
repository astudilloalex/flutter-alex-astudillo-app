import 'package:alex_astudillo/src/political_division_type/domain/political_division_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'political_division.g.dart';

@JsonSerializable()
class PoliticalDivision {
  const PoliticalDivision({
    this.active = true,
    this.code = '',
    this.countryId = 0,
    this.creationDate,
    this.description,
    this.id = 0,
    this.inverserParent,
    this.name = '',
    this.parent,
    this.parentId,
    this.politicalDivisionType,
    this.politicalDivisionTypeId = 0,
    this.updateDate,
  });

  final int id;
  final int countryId;
  final int politicalDivisionTypeId;
  final int? parentId;
  final String code;
  final String name;
  final String? description;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final PoliticalDivisionType? politicalDivisionType;
  final PoliticalDivision? parent;
  final List<PoliticalDivision>? inverserParent;

  PoliticalDivision copyWith({
    int? id,
    int? countryId,
    int? politicalDivisionTypeId,
    int? parentId,
    String? code,
    String? name,
    String? description,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    PoliticalDivisionType? politicalDivisionType,
    PoliticalDivision? parent,
    List<PoliticalDivision>? inverserParent,
  }) {
    return PoliticalDivision(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      politicalDivisionTypeId:
          politicalDivisionTypeId ?? this.politicalDivisionTypeId,
      parentId: parentId ?? this.parentId,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      politicalDivisionType:
          politicalDivisionType ?? this.politicalDivisionType,
      parent: parent ?? this.parent,
      inverserParent: inverserParent ?? this.inverserParent,
    );
  }

  factory PoliticalDivision.fromJson(Map<String, dynamic> json) =>
      _$PoliticalDivisionFromJson(json);

  Map<String, dynamic> toJson() => _$PoliticalDivisionToJson(this);
}
