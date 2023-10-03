import 'package:alex_astudillo/src/auth/application/auth_service.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/ui/pages/sign_in/states/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required this.authService,
  }) : super(const SignInState());

  final AuthService authService;

  Future<String?> signIn(String email, String password) async {
    try {
      await authService.signIn(email, password);
    } on HttpException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }
}
