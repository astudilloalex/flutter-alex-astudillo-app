import 'package:alex_astudillo/ui/pages/sign_in/adaptative/sign_in_desktop_page.dart';
import 'package:alex_astudillo/ui/pages/sign_in/adaptative/sign_in_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: SignInDesktopPage(),
      phone: SignInPhonePage(),
      tablet: SignInDesktopPage(),
    );
  }
}
