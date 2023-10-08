import 'package:alex_astudillo/ui/pages/forgot_password/adaptative/forgot_password_desktop_page.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/adaptative/forgot_password_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWidget(
        desktop: ForgotPasswordDesktopPage(),
        phone: ForgotPasswordPhonePage(),
        tablet: ForgotPasswordDesktopPage(),
      ),
    );
  }
}
