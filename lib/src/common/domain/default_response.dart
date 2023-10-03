import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse {
  const DefaultResponse({
    this.data,
    this.first = true,
    this.last = false,
    required this.message,
    this.numberOfElements,
    this.offset,
    this.pageNumber,
    required this.statusCode,
    this.totalElements,
    this.totalPages,
  });

  final dynamic data;
  final bool first;
  final bool last;
  final String message;
  final int? numberOfElements;
  final int? offset;
  final int? pageNumber;
  final int statusCode;
  final int? totalElements;
  final int? totalPages;

  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return _$DefaultResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}
