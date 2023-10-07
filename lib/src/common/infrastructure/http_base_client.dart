import 'dart:convert';
import 'dart:io';

import 'package:alex_astudillo/src/common/infrastructure/secure_local_data.dart';
import 'package:flutter/foundation.dart' show compute, kIsWeb;
import 'package:http/http.dart';
import 'package:http/retry.dart';

class HttpBaseClient extends BaseClient {
  HttpBaseClient({
    required this.client,
    required this.secureLocalData,
  });

  final RetryClient client;
  final SecureLocalData secureLocalData;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    // Get and set token to header requests.
    final String? token = await secureLocalData.jwt;
    if (token != null) {
      request.headers.addAll({
        HttpHeaders.authorizationHeader: token,
      });
    }
    // Set accept header.
    if (!request.headers.containsKey(HttpHeaders.acceptHeader)) {
      request.headers.addAll({HttpHeaders.acceptHeader: 'application/json'});
    }
    // Set content type.
    if (!request.headers.containsKey(HttpHeaders.contentTypeHeader) ||
        request.headers[HttpHeaders.contentTypeHeader]!
            .contains('text/plain')) {
      request.headers.addAll({
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      });
    }
    return client.send(request);
  }

  String get apiAuthorityV1 => 'http://localhost:5034/api/v1';

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
