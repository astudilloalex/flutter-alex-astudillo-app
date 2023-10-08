import 'package:alex_astudillo/app/app.dart';
import 'package:alex_astudillo/app/app_util.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/cubits/forgot_password_cubit.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/states/forgot_password_state.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: emailController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (AppUtil.isEmail(value)) return null;
              return AppLocalizations.of(context)!.invalidEmail;
            },
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              return ElevatedButton.icon(
                onPressed: state.loading ? null : _send,
                icon: state.loading
                    ? const SizedBox(
                        width: 15.0,
                        height: 15.0,
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : const Icon(Icons.send_outlined),
                label: Text(AppLocalizations.of(context)!.send),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _send() async {
    if (!formKey.currentState!.validate()) return;
    context.loaderOverlay.show();
    final String? error =
        await context.read<ForgotPasswordCubit>().sendPasswordResetEmail(
              emailController.text,
            );
    if (mounted) context.loaderOverlay.hide();
    if (error != null && mounted) {
      showErrorSnackbar(context, error);
    } else if (mounted) {
      showSuccessfulSnackbar(
        context,
        AppLocalizations.of(context)!.checkYourEmail,
      );
      context.goNamed(RouteName.signIn);
    }
  }
}
