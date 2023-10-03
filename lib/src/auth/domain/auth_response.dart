import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  const AuthResponse({
    this.idToken = '',
    this.expiresIn = '3600',
    this.localId = '',
    this.refreshToken = '',
  });

  final String idToken;
  final String refreshToken;
  final String expiresIn;
  final String localId;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
