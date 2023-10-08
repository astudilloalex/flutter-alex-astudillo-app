import 'package:alex_astudillo/app/app.dart';
import 'package:alex_astudillo/app/app_util.dart';
import 'package:alex_astudillo/ui/pages/sign_up/cubits/sign_up_cubit.dart';
import 'package:alex_astudillo/ui/pages/sign_up/states/sign_up_state.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  bool viewPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
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
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: passwordController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password,
              prefixIcon: const Icon(Icons.password_outlined),
              suffixIcon: IconButton(
                onPressed: () => setState(() => viewPassword = !viewPassword),
                icon: Icon(
                  !viewPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: repeatPasswordController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.repeatPassword,
              prefixIcon: const Icon(Icons.password_outlined),
              suffixIcon: IconButton(
                onPressed: () => setState(() => viewPassword = !viewPassword),
                icon: Icon(
                  !viewPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
            ),
            obscureText: !viewPassword,
            validator: (value) {
              if (passwordController.text == repeatPasswordController.text) {
                return null;
              }
              return AppLocalizations.of(context)!.passwordsDoNotMatch;
            },
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return ElevatedButton.icon(
                onPressed: state.loading ? null : _signUp,
                icon: state.loading
                    ? const SizedBox(
                        width: 15.0,
                        height: 15.0,
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : const Icon(Icons.login_outlined),
                label: Text(AppLocalizations.of(context)!.signUp),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    if (!formKey.currentState!.validate()) return;
    if (!formKey.currentState!.validate()) return;
    final SignUpCubit cubit = context.read<SignUpCubit>();
    final Future<String?> future = cubit.signUp(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    context.loaderOverlay.show();
    await future.then((value) {
      if (value == null) context.goNamed(RouteName.home);
      if (value != null) showErrorSnackbar(context, value);
    });
    if (mounted) context.loaderOverlay.hide();
  }
}
