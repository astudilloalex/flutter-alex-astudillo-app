import 'package:alex_astudillo/src/common/domain/http_exception.dart';
import 'package:alex_astudillo/ui/pages/auth/states/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.mode,
    required this.oobCode,
  }) : super(const AuthState());

  final String mode;
  final String oobCode;

  Future<String?> executeAction() async {
    try {
      emit(state.copyWith(loading: true));
      if (mode.isEmpty) {
        await Future.delayed(const Duration(seconds: 1));
      } else if (mode == 'verifyEmail') {}
    } on HttpException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    } finally {
      emit(state.copyWith(loading: false));
    }
    return null;
  }

  Future<String?> changePassword(String password) async {
    try {
      emit(state.copyWith(loading: true));
    } on HttpException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    } finally {
      emit(state.copyWith(loading: false));
    }
    return null;
  }
}
