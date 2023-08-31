class SignInState {
  const SignInState({
    this.loading = false,
  });

  final bool loading;

  SignInState copyWith({
    bool? loading,
  }) {
    return SignInState(
      loading: loading ?? this.loading,
    );
  }
}
