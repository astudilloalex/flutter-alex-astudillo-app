class SplashState {
  const SplashState({
    this.loading = false,
  });

  final bool loading;

  SplashState copyWith({
    bool? loading,
  }) {
    return SplashState(
      loading: loading ?? this.loading,
    );
  }
}
