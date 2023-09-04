class ProfileDetailState {
  const ProfileDetailState({
    this.currentMenuIndex,
  });

  final int? currentMenuIndex;

  ProfileDetailState copyWith({
    int? currentMenuIndex,
  }) {
    return ProfileDetailState(
      currentMenuIndex: currentMenuIndex ?? this.currentMenuIndex,
    );
  }
}
