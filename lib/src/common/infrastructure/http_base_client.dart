import 'dart:convert';

import 'package:flutter/foundation.dart' show compute, kIsWeb;
import 'package:http/http.dart';
import 'package:http/retry.dart';

class HttpBaseClient extends BaseClient {
  HttpBaseClient({
    required this.client,
  });

  final RetryClient client;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    // TODO: implement send
    return client.send(request);
  }

  String get apiAuthority => 'http://localhost:5034/api/v1';

  /// Parse [data] map to json with isolates.
  Future<String> parseToJson(Map<String, dynamic> data) async {
    if (kIsWeb) return _toJson(data);
    return compute(_toJson, data);
  }

  /// Parse json [data] with isolates.
  Future<Map<String, dynamic>> parseFromJson(String data) async {
    if (kIsWeb) return _fromJson(data);
    return compute(_fromJson, data);
  }
}

/// Used to separate the conversion on isolates.
String _toJson(Map<String, dynamic> data) {
  return json.encode(data);
}

/// Used to separate the json string convertion on isolates.
Map<String, dynamic> _fromJson(String data) {
  return json.decode(data) as Map<String, dynamic>;
}
