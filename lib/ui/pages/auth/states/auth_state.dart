class AuthState {
  const AuthState({
    this.loading = false,
    this.emailVerified = false,
    this.error,
  });

  final bool loading;
  final bool emailVerified;
  final String? error;

  AuthState copyWith({
    bool? loading,
    bool? emailVerified,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      emailVerified: emailVerified ?? this.emailVerified,
      error: error ?? this.error,
    );
  }
}
