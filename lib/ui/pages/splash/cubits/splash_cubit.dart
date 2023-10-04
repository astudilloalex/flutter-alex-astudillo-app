import 'package:alex_astudillo/src/auth/application/auth_service.dart';
import 'package:alex_astudillo/ui/pages/splash/states/splash_state.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.authService,
  }) : super(const SplashState());

  final AuthService authService;

  Future<String> get route async {
    try {
      await authService.exchangeRefreshToken();
      return RouteName.home;
    } on Exception {
      return RouteName.signIn;
    }
  }
}
