import 'package:alex_astudillo/ui/pages/sign_up/adaptative/sign_up_desktop_page.dart';
import 'package:alex_astudillo/ui/pages/sign_up/adaptative/sign_up_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
          desktop: SignUpDesktopPage(),
          phone: SignUpPhonePage(),
          tablet: SignUpDesktopPage(),
        ),
      ),
    );
  }
}
