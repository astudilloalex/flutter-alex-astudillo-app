class AuthState {
  const AuthState({
    this.loading = false,
    this.verifyingEmail = false,
  });

  final bool loading;
  final bool verifyingEmail;

  AuthState copyWith({
    bool? loading,
    bool? verifyingEmail,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      verifyingEmail: verifyingEmail ?? this.verifyingEmail,
    );
  }
}
