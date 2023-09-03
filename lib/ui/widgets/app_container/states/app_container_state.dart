class AppContainerState {
  const AppContainerState({
    this.currentIndex = 0,
    this.countNotifications = 0,
  });

  final int currentIndex;
  final int countNotifications;

  AppContainerState copyWith({
    int? currentIndex,
    int? countNotifications,
  }) {
    return AppContainerState(
      currentIndex: currentIndex ?? this.currentIndex,
      countNotifications: countNotifications ?? this.countNotifications,
    );
  }
}
