import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class File {
  const File({
    this.active = true,
    this.code = '',
    this.creationDate,
    this.extension = '',
    this.id = 0,
    this.name = '',
    this.updateDate,
    this.url = '',
    this.userCode = '',
  });

  final int id;
  final String code;
  final String extension;
  final String name;
  final String url;
  final bool active;
  final DateTime? creationDate;
  final DateTime? updateDate;
  final String userCode;

  File copyWith({
    int? id,
    String? code,
    String? extension,
    String? name,
    String? url,
    bool? active,
    DateTime? creationDate,
    DateTime? updateDate,
    String? userCode,
  }) {
    return File(
      id: id ?? this.id,
      code: code ?? this.code,
      extension: extension ?? this.extension,
      name: name ?? this.name,
      url: url ?? this.url,
      active: active ?? this.active,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      userCode: userCode ?? this.userCode,
    );
  }

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
