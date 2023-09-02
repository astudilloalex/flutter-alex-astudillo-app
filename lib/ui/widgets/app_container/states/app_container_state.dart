class AppContainerState {
  const AppContainerState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  AppContainerState copyWith({
    int? currentIndex,
  }) {
    return AppContainerState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
