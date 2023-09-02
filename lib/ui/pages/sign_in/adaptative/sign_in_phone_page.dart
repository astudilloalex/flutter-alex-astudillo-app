import 'package:alex_astudillo/ui/pages/sign_in/widgets/sign_in_form_container.dart';
import 'package:flutter/material.dart';

class SignInPhonePage extends StatelessWidget {
  const SignInPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignInFormContainer()));
  }
}
