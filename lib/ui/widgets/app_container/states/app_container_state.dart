import 'package:alex_astudillo/src/company/domain/company.dart';

class AppContainerState {
  const AppContainerState({
    this.currentIndex = 0,
    this.countNotifications = 0,
    this.companies = const [],
  });

  final int currentIndex;
  final int countNotifications;
  final List<Company> companies;

  AppContainerState copyWith({
    int? currentIndex,
    int? countNotifications,
    List<Company>? companies,
  }) {
    return AppContainerState(
      currentIndex: currentIndex ?? this.currentIndex,
      countNotifications: countNotifications ?? this.countNotifications,
      companies: companies ?? this.companies,
    );
  }
}
