import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          ),
          const SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined),
            label: Text(AppLocalizations.of(context)!.changePassword),
          ),
        ],
      ),
    );
  }
}
