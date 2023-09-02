import 'package:alex_astudillo/ui/pages/forgot_password/adaptative/forgot_password_desktop_page.dart';
import 'package:alex_astudillo/ui/pages/forgot_password/adaptative/forgot_password_phone_page.dart';
import 'package:alex_astudillo/ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forgottenPassword),
        centerTitle: true,
      ),
      body: const ResponsiveWidget(
        desktop: ForgotPasswordDesktopPage(),
        phone: ForgotPasswordPhonePage(),
        tablet: ForgotPasswordDesktopPage(),
      ),
    );
  }
}
