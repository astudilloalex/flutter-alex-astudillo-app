import 'package:alex_astudillo/src/common/domain/default_response.dart';
import 'package:alex_astudillo/src/company/domain/company.dart';

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

/// Use in separate thread for large data.
List<T> _parseDynamicList<T>(List<dynamic> jsonList) {
  final List<T> data = [];
  for (final dynamic json in jsonList) {
    if (json is! Map<String, dynamic>) continue;
    // Check the [T] type and add data to new list.
    switch (T) {
      case Company _:
        data.add(Company.fromJson(json) as T);
    }
  }
  return data;
}
