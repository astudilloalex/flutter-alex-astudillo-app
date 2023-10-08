import 'package:alex_astudillo/src/auth/application/auth_service.dart';
import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/states/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required this.authService,
  }) : super(const ForgotPasswordState());

  final AuthService authService;

  Future<String?> sendPasswordResetEmail(String email) async {
    try {
      await authService.sendPasswordResetEmail(email);
    } on HttpException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }
}
