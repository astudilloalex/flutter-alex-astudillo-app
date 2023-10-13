import 'package:alex_astudillo/src/company/domain/company.dart';
import 'package:alex_astudillo/src/menu/domain/menu.dart';

class AppContainerState {
  const AppContainerState({
    this.currentIndex = 0,
    this.countNotifications = 0,
    this.companies = const [],
    this.menus = const [],
  });

  final int currentIndex;
  final int countNotifications;
  final List<Company> companies;
  final List<Menu> menus;

  AppContainerState copyWith({
    int? currentIndex,
    int? countNotifications,
    List<Company>? companies,
    List<Menu>? menus,
  }) {
    return AppContainerState(
      currentIndex: currentIndex ?? this.currentIndex,
      countNotifications: countNotifications ?? this.countNotifications,
      companies: companies ?? this.companies,
      menus: menus ?? this.menus,
    );
  }
}
