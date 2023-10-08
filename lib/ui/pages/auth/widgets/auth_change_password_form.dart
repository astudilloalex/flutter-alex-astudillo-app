import 'package:alex_astudillo/app/app.dart';
import 'package:alex_astudillo/app/app_util.dart';
import 'package:alex_astudillo/ui/pages/auth/cubits/auth_cubit.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthChangePasswordForm extends StatefulWidget {
  const AuthChangePasswordForm({super.key});

  @override
  State<AuthChangePasswordForm> createState() => _AuthChangePasswordFormState();
}

class _AuthChangePasswordFormState extends State<AuthChangePasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  bool viewPassword = false;

  @override
  void dispose() {
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.newPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    viewPassword = !viewPassword;
                  });
                },
                icon: viewPassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            ),
            obscureText: !viewPassword,
            validator: (value) {
              if (AppUtil.isSafePassword(value)) return null;
              return AppLocalizations.of(context)!.weakPassword;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: repeatPasswordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.repeatPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    viewPassword = !viewPassword;
                  });
                },
                icon: viewPassword
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            ),
            obscureText: !viewPassword,
            validator: (value) {
              if (value == passwordController.text) return null;
              return AppLocalizations.of(context)!.passwordsDoNotMatch;
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: _changePassword,
            icon: const Icon(Icons.save_outlined),
            label: Text(AppLocalizations.of(context)!.changePassword),
          ),
        ],
      ),
    );
  }

  Future<void> _changePassword() async {
    if (!formKey.currentState!.validate()) return;
    context.loaderOverlay.show();
    final String? error = await context.read<AuthCubit>().changePassword(
          passwordController.text,
        );
    if (mounted) context.loaderOverlay.hide();
    if (error != null && mounted) {
      showErrorSnackbar(context, error);
    } else if (mounted) {
      context.goNamed(RouteName.signIn);
    }
  }
}
