import 'package:alex_astudillo/src/auth/application/auth_service.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/ui/pages/sign_up/states/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.authService,
  }) : super(const SignUpState());

  final AuthService authService;

  Future<String?> signUp(String email, String password) async {
    try {
      await authService.signUp(email, password);
    } on HttpException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }
}
