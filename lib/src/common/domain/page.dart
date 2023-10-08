import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Page<T> {
  const Page({
    this.data = const [],
    this.first = true,
    this.last = false,
    this.numberOfElements = 10,
    this.offset = 0,
    this.pageNumber = 1,
    this.totalElements = 10,
    this.totalPages = 1,
  });

  final List<T> data;
  final bool first;
  final bool last;
  final int numberOfElements;
  final int offset;
  final int pageNumber;
  final int totalElements;
  final int totalPages;

  Page<T> copyWith({
    List<T>? data,
    bool? first,
    bool? last,
    int? numberOfElements,
    int? offset,
    int? pageNumber,
    int? totalElements,
    int? totalPages,
  }) {
    return Page<T>(
      data: data ?? this.data,
      first: first ?? this.first,
      last: last ?? this.last,
      numberOfElements: numberOfElements ?? this.numberOfElements,
      offset: offset ?? this.offset,
      pageNumber: pageNumber ?? this.pageNumber,
      totalElements: totalElements ?? this.totalElements,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  /// Construct a Page based on type of response data, if data is not list then
  /// throw exception.
  static Page<T> fromDefaultResponse<T>(DefaultResponse response) {
    return Page<T>(
      data: _parseDynamicList<T>(response.data as List<dynamic>),
      first: response.first,
      last: response.last,
      numberOfElements: response.numberOfElements ?? 0,
      offset: response.offset ?? 0,
      pageNumber: response.pageNumber ?? 0,
      totalElements: response.totalElements ?? 0,
      totalPages: response.totalPages ?? 0,
    );
  }
}

List<T> _parseDynamicList<T>(List<dynamic> json) {
  switch (T) {
    case Company _:
      return json
          .map((json) => Company.fromJson(json as Map<String, dynamic>))
          .toList() as List<T>;
    default:
      return json as List<T>;
  }
}
