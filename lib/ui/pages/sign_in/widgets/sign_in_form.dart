import 'package:alex_astudillo/app/app_util.dart';
import 'package:alex_astudillo/ui/pages/sign_in/cubits/sign_in_cubit.dart';
import 'package:alex_astudillo/ui/pages/sign_in/states/sign_in_state.dart';
import 'package:alex_astudillo/ui/routes/route_name.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool viewPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                if (kIsWeb) {
                  context.goNamed(RouteName.forgotPassword);
                } else {
                  context.pushNamed(RouteName.forgotPassword);
                }
              },
              child: Text(AppLocalizations.of(context)!.forgotYourPassword),
            ),
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return ElevatedButton.icon(
                onPressed: state.loading ? null : _signIn,
                icon: state.loading
                    ? const SizedBox(
                        width: 15.0,
                        height: 15.0,
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : const Icon(Icons.login_outlined),
                label: Text(AppLocalizations.of(context)!.signIn),
              );
            },
          ),
        ],
      ),
    );
  }

  void _signIn() {
    if (!formKey.currentState!.validate()) return;
    final SignInCubit cubit = context.read<SignInCubit>();
    final Future<String?> future = cubit.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    future.then((value) {
      if (value == null) context.goNamed(RouteName.home);
    });
  }
}
