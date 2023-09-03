import 'package:json_annotation/json_annotation.dart';

part 'user_metadatum.g.dart';

@JsonSerializable()
class UserMetadatum {
  const UserMetadatum({
    required this.creationTimestamp,
    this.lastRefreshTimestamp,
    this.lastSignInTimestamp,
    this.userId = 0,
  });

  final int userId;
  final DateTime creationTimestamp;
  final DateTime? lastRefreshTimestamp;
  final DateTime? lastSignInTimestamp;

  UserMetadatum copyWith({
    int? userId,
    DateTime? creationTimestamp,
    DateTime? lastRefreshTimestamp,
    DateTime? lastSignInTimestamp,
  }) {
    return UserMetadatum(
      userId: userId ?? this.userId,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      lastRefreshTimestamp: lastRefreshTimestamp ?? this.lastRefreshTimestamp,
      lastSignInTimestamp: lastSignInTimestamp ?? this.lastSignInTimestamp,
    );
  }

  factory UserMetadatum.fromJson(Map<String, dynamic> json) =>
      _$UserMetadatumFromJson(json);

  Map<String, dynamic> toJson() => _$UserMetadatumToJson(this);
}
