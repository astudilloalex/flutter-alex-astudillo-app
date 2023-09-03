import 'package:alex_astudillo/src/file/domain/file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_file.g.dart';

@JsonSerializable()
class PersonFile {
  const PersonFile({
    this.active = true,
    this.file,
    this.fileId = 0,
    this.personId = 0,
    this.type = 'P',
  });

  final int personId;
  final int fileId;
  final String type;
  final bool active;
  final File? file;

  PersonFile copyWith({
    int? personId,
    int? fileId,
    String? type,
    bool? active,
    File? file,
  }) {
    return PersonFile(
      personId: personId ?? this.personId,
      fileId: fileId ?? this.fileId,
      type: type ?? this.type,
      active: active ?? this.active,
      file: file ?? this.file,
    );
  }

  factory PersonFile.fromJson(Map<String, dynamic> json) =>
      _$PersonFileFromJson(json);

  Map<String, dynamic> toJson() => _$PersonFileToJson(this);
}
