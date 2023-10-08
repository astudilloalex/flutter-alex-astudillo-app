class DashboardState {
  const DashboardState({
    this.loading = false,
  });

  final bool loading;

  DashboardState copyWith({
    bool? loading,
  }) {
    return DashboardState(
      loading: loading ?? this.loading,
    );
  }
}
