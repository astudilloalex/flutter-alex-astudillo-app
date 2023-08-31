import 'package:alex_astudillo/ui/pages/sign_in/cubits/sign_in_cubit.dart';
import 'package:alex_astudillo/ui/pages/sign_in/states/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            controller: emailController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: passwordController,
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
    final SignInCubit cubit = context.read<SignInCubit>();
    final Future<String?> future = cubit.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    future.then((value) {});
  }
}
