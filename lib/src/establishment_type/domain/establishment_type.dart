import 'package:json_annotation/json_annotation.dart';

part 'establishment_type.g.dart';

@JsonSerializable()
class EstablishmentType {
  const EstablishmentType({
    this.active = true,
    this.code = '',
    this.creationDate,
    this.description,
    this.id = 0,
    this.name = '',
    this.updateDate,
  });

  final int id;
  final String code;
  final String name;
  final String? description;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;

  EstablishmentType copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
  }) {
    return EstablishmentType(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
    );
  }

  factory EstablishmentType.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$EstablishmentTypeToJson(this);
}
